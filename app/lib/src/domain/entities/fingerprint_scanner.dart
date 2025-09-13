import 'dart:typed_data';

/// Entity representing a fingerprint scanner configuration
class FingerprintScannerConfig {
  final String? port;
  final int baudRate;
  final bool isConnected;

  const FingerprintScannerConfig({
    this.port,
    this.baudRate = 57600,
    this.isConnected = false,
  });

  FingerprintScannerConfig copyWith({
    String? port,
    int? baudRate,
    bool? isConnected,
  }) {
    return FingerprintScannerConfig(
      port: port ?? this.port,
      baudRate: baudRate ?? this.baudRate,
      isConnected: isConnected ?? this.isConnected,
    );
  }
}

/// Entity representing a captured fingerprint image
class FingerprintImage {
  final Uint8List imageData;
  final String filePath;
  final DateTime capturedAt;
  final int width;
  final int height;

  const FingerprintImage({
    required this.imageData,
    required this.filePath,
    required this.capturedAt,
    this.width = 256,
    this.height = 288,
  });
}

/// Entity representing scanner status
class ScannerStatus {
  final String message;
  final bool isCapturing;
  final bool hasError;

  const ScannerStatus({
    required this.message,
    this.isCapturing = false,
    this.hasError = false,
  });

  ScannerStatus copyWith({String? message, bool? isCapturing, bool? hasError}) {
    return ScannerStatus(
      message: message ?? this.message,
      isCapturing: isCapturing ?? this.isCapturing,
      hasError: hasError ?? this.hasError,
    );
  }
}

/// Entity representing available serial ports
class SerialPortInfo {
  final List<String> availablePorts;
  final List<int> supportedBaudRates;

  const SerialPortInfo({
    required this.availablePorts,
    required this.supportedBaudRates,
  });
}

/// Entity representing fingerprint match result
class FingerprintMatchResult {
  final bool isMatch;
  final double confidence;
  final String? matchId;
  final String? message;
  final DateTime timestamp;
  final int? time; // API elapsed time in milliseconds

  const FingerprintMatchResult({
    required this.isMatch,
    required this.confidence,
    this.matchId,
    this.message,
    required this.timestamp,
    this.time,
  });

  @override
  String toString() {
    return 'FingerprintMatchResult(isMatch: $isMatch, confidence: $confidence, matchId: $matchId, time: $time)';
  }
}
