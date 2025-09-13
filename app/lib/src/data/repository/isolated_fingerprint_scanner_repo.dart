import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';
import 'dart:io';
import 'package:flutter_libserialport/flutter_libserialport.dart';
import 'package:hackathon/src/core/utils/log.dart';
import 'package:hackathon/src/data/service/fingerprint_api_service.dart'
    hide FingerprintMatchResult;
import 'package:hackathon/src/data/service/scanner_isolate.dart';
import 'package:hackathon/src/domain/entities/fingerprint_scanner.dart';
import 'package:hackathon/src/domain/repo/fingerprint_scanner_repo.dart';
import 'package:path_provider/path_provider.dart';
import 'package:image/image.dart' as img;

/// Isolated fingerprint scanner repository implementation
/// Uses isolates for hardware communication to prevent UI blocking
class IsolatedFingerprintScannerRepo implements FingerprintScannerRepo {
  final FingerprintApiService _apiService;
  final ScannerIsolate _scannerIsolate;
  final StreamController<ScannerIsolateResponse> _responseController =
      StreamController<ScannerIsolateResponse>.broadcast();

  bool _isConnected = false;
  bool _isListenerSetup = false;

  // Completers for one-time operations
  Completer<ConnectedResponse>? _connectCompleter;
  Completer<DisconnectedResponse>? _disconnectCompleter;
  Completer<FingerprintCapturedResponse>? _captureCompleter;
  Completer<BaudRateSetResponse>? _baudRateCompleter;

  IsolatedFingerprintScannerRepo({
    required FingerprintApiService apiService,
    ScannerIsolate? scannerIsolate,
  }) : _apiService = apiService,
       _scannerIsolate = scannerIsolate ?? ScannerIsolate() {
    // Don't set up listener in constructor to avoid multiple listeners
  }

  void _setupIsolateListener() {
    if (_isListenerSetup) return;

    _scannerIsolate.responses.listen((response) {
      _responseController.add(response);

      if (response is ConnectedResponse) {
        _isConnected = response.success;
        _connectCompleter?.complete(response);
        _connectCompleter = null;
      } else if (response is DisconnectedResponse) {
        _isConnected = false;
        _disconnectCompleter?.complete(response);
        _disconnectCompleter = null;
      } else if (response is FingerprintCapturedResponse) {
        _captureCompleter?.complete(response);
        _captureCompleter = null;
      } else if (response is BaudRateSetResponse) {
        _baudRateCompleter?.complete(response);
        _baudRateCompleter = null;
      }
    });

    _isListenerSetup = true;
  }

  @override
  Future<void> connect(String port, int baudRate) async {
    try {
      // Ensure listener is set up before starting isolate
      _setupIsolateListener();

      if (!_scannerIsolate.isRunning) {
        await _scannerIsolate.start();
      }

      // Create completer for this connection attempt
      _connectCompleter = Completer<ConnectedResponse>();

      _scannerIsolate.connect(port, baudRate);

      // Wait for connection response
      final response = await _connectCompleter!.future.timeout(
        const Duration(seconds: 10),
      );

      if (response.success) {
        await log('Scanner connected to $port at $baudRate baud');
      } else {
        throw Exception(response.error ?? 'Connection failed');
      }
    } catch (e) {
      await log('Connection error: $e');
      rethrow;
    }
  }

  @override
  Future<void> disconnect() async {
    try {
      // Ensure listener is set up
      _setupIsolateListener();

      // Create completer for this disconnection attempt
      _disconnectCompleter = Completer<DisconnectedResponse>();

      _scannerIsolate.disconnect();

      // Wait for disconnection response
      final response = await _disconnectCompleter!.future.timeout(
        const Duration(seconds: 5),
      );

      if (!response.success) {
        throw Exception(response.error ?? 'Disconnection failed');
      }

      await log('Scanner disconnected');
    } catch (e) {
      await log('Disconnect error: $e');
      rethrow;
    }
  }

  @override
  Future<FingerprintImage> captureFingerprint() async {
    try {
      if (!_isConnected) {
        throw Exception('Scanner not connected');
      }

      // Ensure listener is set up
      _setupIsolateListener();

      // Create completer for this capture attempt
      _captureCompleter = Completer<FingerprintCapturedResponse>();

      _scannerIsolate.captureFingerprint();

      // Wait for capture response
      final response = await _captureCompleter!.future.timeout(
        const Duration(seconds: 30),
      );

      if (response.success && response.image != null) {
        // Save the image in the main thread
        final imagePath = await saveImage(response.image!.imageData);

        final finalImage = FingerprintImage(
          imageData: response.image!.imageData,
          filePath: imagePath,
          capturedAt: response.image!.capturedAt,
        );

        await log('Fingerprint captured successfully');
        return finalImage;
      } else {
        throw Exception(response.error ?? 'Capture failed');
      }
    } catch (e) {
      await log('Capture error: $e');
      rethrow;
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

  @override
  Future<void> setBaudRate(int baudRate) async {
    try {
      if (!_isConnected) {
        throw Exception('Scanner not connected');
      }

      // Ensure listener is set up
      _setupIsolateListener();

      // Create completer for this baud rate setting attempt
      _baudRateCompleter = Completer<BaudRateSetResponse>();

      _scannerIsolate.setBaudRate(baudRate);

      // Wait for baud rate response
      final response = await _baudRateCompleter!.future.timeout(
        const Duration(seconds: 5),
      );

      if (response.success) {
        await log('Baud rate set to $baudRate');
      } else {
        throw Exception(response.error ?? 'Failed to set baud rate');
      }
    } catch (e) {
      await log('Set baud rate error: $e');
      rethrow;
    }
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
      final configFile = File('${directory.path}/fingerprint_config.json');

      if (await configFile.exists()) {
        final jsonString = await configFile.readAsString();
        final json = jsonDecode(jsonString);
        return FingerprintScannerConfig(
          port: json['port'],
          baudRate: json['baudRate'] ?? 57600,
          isConnected: json['isConnected'] ?? false,
        );
      }

      return const FingerprintScannerConfig();
    } catch (e) {
      await log('Failed to load config: $e');
      return const FingerprintScannerConfig();
    }
  }

  @override
  Future<void> saveConfig(FingerprintScannerConfig config) async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final configFile = File('${directory.path}/fingerprint_config.json');
      final json = {
        'port': config.port,
        'baudRate': config.baudRate,
        'isConnected': config.isConnected,
      };
      await configFile.writeAsString(jsonEncode(json));
    } catch (e) {
      await log('Failed to save config: $e');
    }
  }

  @override
  Future<void> log(String message) async {
    try {
      logger.log(message);
    } catch (e) {
      // Ignore logging errors
    }
  }

  /// Get the response stream for listening to isolate events
  Stream<ScannerIsolateResponse> get responseStream =>
      _responseController.stream;

  @override
  Future<void> clearConfig() async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final configFile = File('${directory.path}/fingerprint_config.json');
      if (await configFile.exists()) {
        await configFile.delete();
      }
    } catch (e) {
      await log('Failed to clear config: $e');
    }
  }

  @override
  Future<SerialPortInfo> getAvailablePorts() async {
    try {
      // Port detection is lightweight, so we can do it in the main thread
      // This avoids the complexity of stream management for a simple operation
      final ports = SerialPort.availablePorts;

      await log('Found ${ports.length} available ports: ${ports.join(', ')}');
      return SerialPortInfo(
        availablePorts: ports,
        supportedBaudRates: const [
          9600,
          19200,
          28800,
          38400,
          48000,
          57600,
          115200,
        ],
      );
    } catch (e) {
      await log('Failed to get available ports: $e');
      return const SerialPortInfo(
        availablePorts: [],
        supportedBaudRates: [9600, 19200, 28800, 38400, 48000, 57600, 115200],
      );
    }
  }

  /// Dispose resources
  void dispose() {
    _scannerIsolate.dispose();
    _responseController.close();
  }
}
