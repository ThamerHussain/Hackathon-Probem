import 'dart:async';
import 'dart:typed_data';
import 'package:flutter_libserialport/flutter_libserialport.dart';
import 'package:hackathon/src/core/utils/log.dart';

/// R307 Fingerprint Scanner Driver
/// Handles low-level communication with the R307 fingerprint scanner module
class R307Driver {
  static const int r307Addr = 0xFFFFFFFF;
  static const int start = 0xEF01;
  static const int pidCommand = 0x01;
  static const int pidData = 0x02;
  static const int pidAck = 0x07;
  static const int pidEndData = 0x08;
  static const int cmdGenImg = 0x01;
  static const int cmdUpImage = 0x0A;
  static const int cmdWriteReg = 0x0E;
  static const int regBaud = 0x04;

  static const Map<int, int> baudToN = {
    9600: 1,
    19200: 2,
    28800: 3,
    38400: 4,
    48000: 5,
    57600: 6,
    115200: 12,
  };

  late SerialPort _port;
  late SerialPortReader _reader;

  R307Driver(String portName, {int baud = 57600, int timeout = 2000}) {
    _port = SerialPort(portName);

    final config = SerialPortConfig();
    config.baudRate = baud;
    config.bits = 8;
    config.parity = SerialPortParity.none;
    config.stopBits = 1;
    config.setFlowControl(SerialPortFlowControl.none);

    try {
      _port.openReadWrite();
    } catch (e) {
      logger.log(e);
      throw Exception('Error accessing serial ports: $e');
    }

    _port.config = config;
    _reader = SerialPortReader(_port, timeout: timeout);
  }

  void close() {
    _reader.close();
    _port.close();
  }

  static int _checksum(int pid, Uint8List contentBytes) {
    final length = contentBytes.length + 2;
    int chk = pid + (length >> 8 & 0xFF) + (length & 0xFF);
    for (final byte in contentBytes) {
      chk += byte;
    }
    return chk & 0xFFFF;
  }

  void _writePacket(int pid, Uint8List contentBytes, {int addr = r307Addr}) {
    final length = contentBytes.length + 2;
    final packet = BytesBuilder();

    packet.add([(start >> 8) & 0xFF, start & 0xFF]);
    packet.add([
      (addr >> 24) & 0xFF,
      (addr >> 16) & 0xFF,
      (addr >> 8) & 0xFF,
      addr & 0xFF,
    ]);
    packet.addByte(pid);
    packet.add([(length >> 8) & 0xFF, length & 0xFF]);
    packet.add(contentBytes);

    final chk = _checksum(pid, contentBytes);
    packet.add([(chk >> 8) & 0xFF, chk & 0xFF]);

    _port.write(packet.toBytes());
  }

  Uint8List _readExact(int n, {int? overallTimeout}) {
    final startTime = DateTime.now();
    final buffer = BytesBuilder();

    while (buffer.length < n) {
      if (overallTimeout != null) {
        final elapsed = DateTime.now().difference(startTime).inMilliseconds;
        if (elapsed > overallTimeout) {
          throw TimeoutException('Serial read timeout');
        }
      }

      final chunk = _reader.port.read(n - buffer.length);
      if (chunk.isNotEmpty) {
        buffer.add(chunk);
      }
    }

    return buffer.toBytes();
  }

  ({int pid, Uint8List content}) _readPacket({int overallTimeout = 5000}) {
    final header = _readExact(9, overallTimeout: overallTimeout);
    final startCode = (header[0] << 8) | header[1];

    if (startCode != start) {
      throw Exception('Bad start code');
    }

    final pid = header[6];
    final length = (header[7] << 8) | header[8];

    if (length < 2) {
      throw Exception('Invalid length');
    }

    final body = _readExact(length, overallTimeout: overallTimeout);
    final content = body.sublist(0, body.length - 2);
    final chkRx = (body[body.length - 2] << 8) | body[body.length - 1];

    if (_checksum(pid, content) != chkRx) {
      throw Exception('Checksum mismatch');
    }

    return (pid: pid, content: content);
  }

  Uint8List _command(int insByte, {Uint8List? params, int ackTimeout = 5000}) {
    final paramBytes = params ?? Uint8List(0);
    final commandBytes = Uint8List.fromList([insByte, ...paramBytes]);

    _writePacket(pidCommand, commandBytes);
    final response = _readPacket(overallTimeout: ackTimeout);

    if (response.pid != pidAck) {
      throw Exception(
        'Expected ACK, got PID 0x${response.pid.toRadixString(16)}',
      );
    }

    return response.content;
  }

  /// Generate fingerprint image
  int genImg() {
    final content = _command(cmdGenImg);
    return content[0];
  }

  /// Upload image data from scanner
  Uint8List upImage({int streamTimeout = 10000}) {
    final content = _command(cmdUpImage);
    final conf = content[0];

    if (conf != 0x00) {
      throw Exception('UpImage NACK: 0x${conf.toRadixString(16)}');
    }

    final imageBytes = BytesBuilder();
    final startTime = DateTime.now();

    while (true) {
      final elapsed = DateTime.now().difference(startTime).inMilliseconds;
      if (elapsed > streamTimeout) {
        throw TimeoutException('Timed out receiving image data');
      }

      final response = _readPacket(overallTimeout: streamTimeout);

      if (response.pid == pidData || response.pid == pidEndData) {
        imageBytes.add(response.content);
        if (response.pid == pidEndData) {
          break;
        }
      } else {
        throw Exception('Unexpected PID: 0x${response.pid.toRadixString(16)}');
      }
    }

    return imageBytes.toBytes();
  }

  /// Write to register
  bool writeReg(int reg, int value) {
    final content = _command(
      cmdWriteReg,
      params: Uint8List.fromList([reg, value]),
    );
    final conf = content[0];

    if (conf != 0x00) {
      throw Exception('WRITE_REG failed: 0x${conf.toRadixString(16)}');
    }

    return true;
  }

  /// Set baud rate
  int setBaudrate(int baudrate) {
    if (!baudToN.containsKey(baudrate)) {
      throw ArgumentError('Unsupported baudrate: $baudrate');
    }

    final n = baudToN[baudrate]!;
    writeReg(regBaud, n);
    return n;
  }

  /// Decode UART image data to 8-bit grayscale
  static Uint8List decodeUartImageTo8bit(
    Uint8List rawBytes, {
    int width = 256,
    int height = 288,
  }) {
    final nPixels = width * height;
    if (rawBytes.length * 2 < nPixels) {
      throw ArgumentError('Not enough data for image');
    }

    final out = Uint8List(nPixels);
    int i = 0;

    for (final byte in rawBytes) {
      if (i < nPixels) {
        out[i] = ((byte >> 4) & 0x0F) * 17;
        i++;
      }
      if (i < nPixels) {
        out[i] = (byte & 0x0F) * 17;
        i++;
      }
    }

    return out;
  }
}
