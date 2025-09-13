import 'dart:async';
import 'dart:isolate';
import 'package:flutter_libserialport/flutter_libserialport.dart';
import 'package:hackathon/src/data/service/r307_driver.dart';
import 'package:hackathon/src/domain/entities/fingerprint_scanner.dart';

/// Messages sent to the scanner isolate
abstract class ScannerIsolateMessage {}

class ConnectMessage extends ScannerIsolateMessage {
  final String port;
  final int baudRate;

  ConnectMessage(this.port, this.baudRate);
}

class DisconnectMessage extends ScannerIsolateMessage {}

class CaptureFingerprintMessage extends ScannerIsolateMessage {}

class SetBaudRateMessage extends ScannerIsolateMessage {
  final int baudRate;

  SetBaudRateMessage(this.baudRate);
}

class GenImageMessage extends ScannerIsolateMessage {}

class GetAvailablePortsMessage extends ScannerIsolateMessage {}

/// Messages sent from the scanner isolate
abstract class ScannerIsolateResponse {}

class ConnectedResponse extends ScannerIsolateResponse {
  final bool success;
  final String? error;

  ConnectedResponse(this.success, [this.error]);
}

class DisconnectedResponse extends ScannerIsolateResponse {
  final bool success;
  final String? error;

  DisconnectedResponse(this.success, [this.error]);
}

class FingerprintCapturedResponse extends ScannerIsolateResponse {
  final bool success;
  final String? error;
  final FingerprintImage? image;

  FingerprintCapturedResponse(this.success, [this.error, this.image]);
}

class BaudRateSetResponse extends ScannerIsolateResponse {
  final bool success;
  final String? error;

  BaudRateSetResponse(this.success, [this.error]);
}

class ImageGeneratedResponse extends ScannerIsolateResponse {
  final bool success;
  final String? error;
  final int? result;

  ImageGeneratedResponse(this.success, [this.error, this.result]);
}

class AvailablePortsResponse extends ScannerIsolateResponse {
  final bool success;
  final String? error;
  final List<String>? ports;

  AvailablePortsResponse(this.success, [this.error, this.ports]);
}

class ErrorResponse extends ScannerIsolateResponse {
  final String error;

  ErrorResponse(this.error);
}

/// Scanner isolate entry point
void scannerIsolateEntryPoint(SendPort sendPort) async {
  final receivePort = ReceivePort();
  sendPort.send(receivePort.sendPort);

  R307Driver? driver;

  receivePort.listen((message) async {
    try {
      if (message is ConnectMessage) {
        try {
          driver = R307Driver(message.port, baud: message.baudRate);
          sendPort.send(ConnectedResponse(true));
        } catch (e) {
          sendPort.send(ConnectedResponse(false, e.toString()));
        }
      } else if (message is DisconnectMessage) {
        try {
          driver?.close();
          driver = null;
          sendPort.send(DisconnectedResponse(true));
        } catch (e) {
          sendPort.send(DisconnectedResponse(false, e.toString()));
        }
      } else if (message is CaptureFingerprintMessage) {
        if (driver == null) {
          sendPort.send(
            FingerprintCapturedResponse(false, 'Scanner not connected'),
          );
          return;
        }

        try {
          // Wait for finger detection
          int genResult;
          do {
            genResult = driver!.genImg();
            if (genResult == 0x00) break;
            await Future.delayed(const Duration(milliseconds: 100));
          } while (genResult != 0x00);

          // Download image
          final rawData = driver!.upImage();
          final pixels8 = R307Driver.decodeUartImageTo8bit(rawData);

          // Create fingerprint image
          final image = FingerprintImage(
            imageData: pixels8,
            filePath: '', // Will be set by the main thread
            capturedAt: DateTime.now(),
          );

          sendPort.send(FingerprintCapturedResponse(true, null, image));
        } catch (e) {
          sendPort.send(FingerprintCapturedResponse(false, e.toString()));
        }
      } else if (message is SetBaudRateMessage) {
        if (driver == null) {
          sendPort.send(BaudRateSetResponse(false, 'Scanner not connected'));
          return;
        }

        try {
          driver!.setBaudrate(message.baudRate);
          sendPort.send(BaudRateSetResponse(true));
        } catch (e) {
          sendPort.send(BaudRateSetResponse(false, e.toString()));
        }
      } else if (message is GenImageMessage) {
        if (driver == null) {
          sendPort.send(ImageGeneratedResponse(false, 'Scanner not connected'));
          return;
        }

        try {
          final result = driver!.genImg();
          sendPort.send(ImageGeneratedResponse(true, null, result));
        } catch (e) {
          sendPort.send(ImageGeneratedResponse(false, e.toString()));
        }
      } else if (message is GetAvailablePortsMessage) {
        try {
          final ports = SerialPort.availablePorts;
          sendPort.send(AvailablePortsResponse(true, null, ports));
        } catch (e) {
          sendPort.send(AvailablePortsResponse(false, e.toString()));
        }
      }
    } catch (e) {
      sendPort.send(ErrorResponse(e.toString()));
    }
  });
}

/// Isolated scanner communication manager
class ScannerIsolate {
  Isolate? _isolate;
  SendPort? _sendPort;
  ReceivePort? _receivePort;
  final StreamController<ScannerIsolateResponse> _responseController =
      StreamController<ScannerIsolateResponse>.broadcast();
  bool _isListenerSetup = false;
  Completer<SendPort>? _sendPortCompleter;

  Stream<ScannerIsolateResponse> get responses => _responseController.stream;

  bool get isRunning => _isolate != null;

  /// Start the scanner isolate
  Future<void> start() async {
    if (_isolate != null) return;

    _receivePort = ReceivePort();
    _sendPortCompleter = Completer<SendPort>();

    _isolate = await Isolate.spawn(
      scannerIsolateEntryPoint,
      _receivePort!.sendPort,
    );

    // Listen for responses only once
    if (!_isListenerSetup) {
      _receivePort!.listen((response) {
        if (response is SendPort) {
          // This is the initial SendPort from the isolate
          _sendPort = response;
          _sendPortCompleter?.complete(response);
          _sendPortCompleter = null;
        } else if (response is ScannerIsolateResponse) {
          _responseController.add(response);
        }
      });
      _isListenerSetup = true;
    }

    // Wait for the isolate to send its SendPort
    _sendPort = await _sendPortCompleter!.future;
  }

  /// Stop the scanner isolate
  Future<void> stop() async {
    if (_isolate == null) return;

    _isolate!.kill();
    _isolate = null;
    _sendPort = null;
    _receivePort?.close();
    _receivePort = null;
    _isListenerSetup = false;
    _sendPortCompleter = null;
  }

  /// Send a message to the isolate
  void _sendMessage(ScannerIsolateMessage message) {
    if (_sendPort == null) {
      throw Exception('Scanner isolate not started');
    }
    _sendPort!.send(message);
  }

  /// Connect to scanner
  void connect(String port, int baudRate) {
    _sendMessage(ConnectMessage(port, baudRate));
  }

  /// Disconnect from scanner
  void disconnect() {
    _sendMessage(DisconnectMessage());
  }

  /// Capture fingerprint
  void captureFingerprint() {
    _sendMessage(CaptureFingerprintMessage());
  }

  /// Set baud rate
  void setBaudRate(int baudRate) {
    _sendMessage(SetBaudRateMessage(baudRate));
  }

  /// Generate image
  void genImage() {
    _sendMessage(GenImageMessage());
  }

  /// Get available ports
  void getAvailablePorts() {
    _sendMessage(GetAvailablePortsMessage());
  }

  /// Dispose resources
  void dispose() {
    stop();
    _responseController.close();
  }
}
