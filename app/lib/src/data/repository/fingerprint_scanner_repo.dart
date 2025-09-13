import 'dart:io';
import 'dart:typed_data';
import 'package:path_provider/path_provider.dart';
import 'package:image/image.dart' as img;
import 'package:flutter_libserialport/flutter_libserialport.dart';
import 'package:hackathon/src/domain/entities/fingerprint_scanner.dart';
import 'package:hackathon/src/domain/repo/fingerprint_scanner_repo.dart';
import 'package:hackathon/src/data/service/r307_driver.dart';
import 'package:hackathon/src/data/service/fingerprint_api_service.dart'
    hide FingerprintMatchResult;

/// Implementation of FingerprintScannerRepo using R307 driver
class ImplFingerprintScannerRepo implements FingerprintScannerRepo {
  R307Driver? _driver;
  final Map<String, String> _config = {};
  final FingerprintApiService _apiService;

  static const List<int> supportedBaudRates = [
    9600,
    19200,
    28800,
    38400,
    48000,
    57600,
    115200,
  ];

  ImplFingerprintScannerRepo({required FingerprintApiService apiService})
    : _apiService = apiService;

  @override
  Future<SerialPortInfo> getAvailablePorts() async {
    final ports = SerialPort.availablePorts;
    return SerialPortInfo(
      availablePorts: ports,
      supportedBaudRates: supportedBaudRates,
    );
  }

  @override
  Future<void> connect(String port, int baudRate) async {
    try {
      _driver?.close();
      _driver = R307Driver(port, baud: baudRate);

      // Test connection with a quick command
      await Future.delayed(const Duration(milliseconds: 100));
    } catch (e) {
      _driver?.close();
      _driver = null;
      throw Exception('Connection failed: $e');
    }
  }

  @override
  Future<void> disconnect() async {
    _driver?.close();
    _driver = null;
  }

  @override
  Future<void> setBaudRate(int baudRate) async {
    if (_driver == null) {
      throw Exception('Not connected');
    }

    _driver!.setBaudrate(baudRate);
  }

  @override
  Future<FingerprintImage> captureFingerprint() async {
    if (_driver == null) {
      throw Exception('Not connected');
    }

    // Wait for finger detection
    const maxWaitTime = Duration(seconds: 15);
    final startTime = DateTime.now();

    while (DateTime.now().difference(startTime) < maxWaitTime) {
      try {
        final result = _driver!.genImg();

        if (result == 0x00) {
          break;
        } else if (result == 0x02) {
          // No finger detected, continue waiting
          await Future.delayed(const Duration(milliseconds: 100));
          continue;
        } else if (result == 0x03) {
          throw Exception('Image capture failed. Adjust finger placement');
        } else {
          throw Exception('GenImg returned code 0x${result.toRadixString(16)}');
        }
      } catch (e) {
        if (DateTime.now().difference(startTime) > maxWaitTime) {
          throw Exception('Timeout waiting for finger');
        }
        await Future.delayed(const Duration(milliseconds: 100));
      }
    }

    // Download image - no delays for hardware communication
    final rawData = _driver!.upImage();

    final pixels8 = R307Driver.decodeUartImageTo8bit(rawData);

    // Save image
    final imagePath = await saveImage(pixels8);

    return FingerprintImage(
      imageData: pixels8,
      filePath: imagePath,
      capturedAt: DateTime.now(),
    );
  }

  @override
  Future<String> saveImage(
    Uint8List pixels8, {
    int width = 256,
    int height = 288,
  }) async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final timestamp = DateTime.now().toIso8601String().replaceAll(':', '-');
      final filename = 'fingerprint_$timestamp.png';
      final file = File('${directory.path}/$filename');

      // Convert to PNG using image package
      final image = img.Image.fromBytes(
        width: width,
        height: height,
        bytes: pixels8.buffer,
        format: img.Format.uint8,
        numChannels: 1,
      );

      final pngBytes = img.encodePng(image);
      await file.writeAsBytes(pngBytes);

      return file.path;
    } catch (e) {
      throw Exception('Failed to save image: $e');
    }
  }

  @override
  Future<FingerprintScannerConfig> loadConfig() async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final file = File('${directory.path}/r307_settings.cfg');

      if (await file.exists()) {
        final content = await file.readAsString();
        final lines = content.split('\n');

        for (final line in lines) {
          final trimmed = line.trim();
          if (trimmed.isEmpty || trimmed.startsWith('#')) continue;

          if (trimmed.contains('=')) {
            final parts = trimmed.split('=');
            if (parts.length >= 2) {
              _config[parts[0].trim()] = parts.sublist(1).join('=').trim();
            }
          }
        }
      }

      return FingerprintScannerConfig(
        port: _config['port'],
        baudRate: int.tryParse(_config['baud'] ?? '57600') ?? 57600,
        isConnected: _driver != null,
      );
    } catch (e) {
      return const FingerprintScannerConfig();
    }
  }

  @override
  Future<void> saveConfig(FingerprintScannerConfig config) async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final file = File('${directory.path}/r307_settings.cfg');

      _config['port'] = config.port ?? '';
      _config['baud'] = config.baudRate.toString();

      final lines = _config.entries.map((e) => '${e.key}=${e.value}').toList();
      await file.writeAsString('${lines.join('\n')}\n');
    } catch (e) {
      throw Exception('Failed to save config: $e');
    }
  }

  @override
  Future<void> clearConfig() async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final file = File('${directory.path}/r307_settings.cfg');
      if (await file.exists()) {
        await file.delete();
      }
      _config.clear();
    } catch (e) {
      throw Exception('Failed to clear config: $e');
    }
  }

  @override
  Future<void> log(String message) async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final file = File('${directory.path}/r307_log.txt');
      final timestamp = DateTime.now().toIso8601String();
      await file.writeAsString(
        '[$timestamp] $message\n',
        mode: FileMode.append,
      );
    } catch (e) {
      // Ignore logging errors
    }
  }

  @override
  Future<FingerprintMatchResult> matchFingerprint(
    Uint8List imageData,
    String filename,
  ) async {
    try {
      // Yield control to allow UI updates before API call
      await Future.delayed(const Duration(milliseconds: 1));

      final apiResult = await _apiService.matchFingerprint(
        imageData: imageData,
        filename: filename,
      );

      // Convert API result to domain entity
      final result = FingerprintMatchResult(
        isMatch: apiResult.isMatch,
        confidence: apiResult.confidence,
        matchId: apiResult.matchId,
        message: apiResult.message,
        timestamp: apiResult.timestamp,
      );

      // Log the match result
      await log(
        'Fingerprint match result: ${result.isMatch ? 'MATCH' : 'NO MATCH'} (confidence: ${result.confidence})',
      );

      return result;
    } catch (e) {
      await log('Fingerprint matching failed: $e');
      rethrow;
    }
  }

  @override
  Future<bool> testApiConnection() async {
    try {
      // Yield control to allow UI updates before API call
      await Future.delayed(const Duration(milliseconds: 1));

      final isConnected = await _apiService.testConnection();

      await log('API connection test: ${isConnected ? 'SUCCESS' : 'FAILED'}');
      return isConnected;
    } catch (e) {
      await log('API connection test error: $e');
      return false;
    }
  }
}
