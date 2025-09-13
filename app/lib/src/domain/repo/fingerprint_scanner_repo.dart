import 'dart:typed_data';
import 'package:hackathon/src/domain/entities/fingerprint_scanner.dart';

/// Repository interface for fingerprint scanner operations
abstract class FingerprintScannerRepo {
  /// Get available serial ports
  Future<SerialPortInfo> getAvailablePorts();

  /// Connect to the fingerprint scanner
  Future<void> connect(String port, int baudRate);

  /// Disconnect from the fingerprint scanner
  Future<void> disconnect();

  /// Set the baud rate of the scanner module
  Future<void> setBaudRate(int baudRate);

  /// Capture a fingerprint image
  Future<FingerprintImage> captureFingerprint();

  /// Save fingerprint image to file
  Future<String> saveImage(Uint8List imageData);

  /// Load scanner configuration
  Future<FingerprintScannerConfig> loadConfig();

  /// Save scanner configuration
  Future<void> saveConfig(FingerprintScannerConfig config);

  /// Clear all configuration
  Future<void> clearConfig();

  /// Log a message
  Future<void> log(String message);

  /// Send fingerprint image to matching endpoint
  Future<FingerprintMatchResult> matchFingerprint(
    Uint8List imageData,
    String filename,
  );

  /// Test connection to fingerprint matching service
  Future<bool> testApiConnection();
}
