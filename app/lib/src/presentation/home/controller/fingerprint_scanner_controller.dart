import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:hackathon/src/core/config/fingerprint_config.dart';
import 'package:hackathon/src/domain/entities/fingerprint_scanner.dart';
import 'package:hackathon/src/domain/repo/fingerprint_scanner_repo.dart';
import 'package:hackathon/src/data/repository/isolated_fingerprint_scanner_repo.dart';
import 'package:hackathon/src/data/service/scanner_isolate.dart';
import 'package:hackathon/src/data/service/fingerprint_api_service.dart'
    hide FingerprintMatchResult;

/// Controller for managing fingerprint scanner state and operations
class FingerprintScannerController extends ChangeNotifier {
  FingerprintScannerRepo _repo;
  IsolatedFingerprintScannerRepo? _isolatedRepo;

  FingerprintScannerController(this._repo) {
    _isolatedRepo = _repo is IsolatedFingerprintScannerRepo
        ? _repo as IsolatedFingerprintScannerRepo
        : null;
    _initialize();
  }

  // State variables
  FingerprintScannerConfig _config = const FingerprintScannerConfig();
  SerialPortInfo _portInfo = const SerialPortInfo(
    availablePorts: [],
    supportedBaudRates: [],
  );
  ScannerStatus _status = const ScannerStatus(message: 'Ready to connect');
  FingerprintImage? _lastCapturedImage;
  FingerprintMatchResult? _lastMatchResult;
  bool _isLoading = false;
  String _currentApiEndpoint = '';
  bool _isApiConnected = false;
  bool _isScannerConnected = false;
  Timer? _debounceTimer;

  // Getters
  FingerprintScannerConfig get config => _config;
  SerialPortInfo get portInfo => _portInfo;
  ScannerStatus get status => _status;
  FingerprintImage? get lastCapturedImage => _lastCapturedImage;
  FingerprintMatchResult? get lastMatchResult => _lastMatchResult;
  bool get isLoading => _isLoading;
  bool get isConnected => _isScannerConnected && _isApiConnected;
  bool get isScannerConnected => _isScannerConnected;
  bool get isApiConnected => _isApiConnected;
  String get currentApiEndpoint => _currentApiEndpoint;

  /// Initialize the controller
  Future<void> _initialize() async {
    await _loadConfiguration();
    await _refreshPorts();
    await _loadApiEndpoint();
    await _checkInitialConnectivity();

    // Listen to isolate responses if using isolated repo
    if (_isolatedRepo != null) {
      _isolatedRepo!.responseStream.listen((response) {
        _handleIsolateResponse(response);
      });
    }
  }

  /// Handle responses from the scanner isolate
  void _handleIsolateResponse(dynamic response) {
    if (response is ConnectedResponse) {
      _isScannerConnected = response.success;
      if (response.success) {
        _setStatus('✅ Scanner connected via isolate', immediate: true);
      } else {
        _setStatus(
          '❌ Scanner connection failed: ${response.error}',
          hasError: true,
        );
      }
      notifyListeners();
    } else if (response is DisconnectedResponse) {
      _isScannerConnected = false;
      _setStatus('🔌 Scanner disconnected via isolate');
      notifyListeners();
    } else if (response is FingerprintCapturedResponse) {
      if (response.success && response.image != null) {
        _lastCapturedImage = response.image;
        _setStatus('📸 Fingerprint captured via isolate!', immediate: true);
      } else {
        _setStatus('❌ Capture failed: ${response.error}', hasError: true);
      }
      notifyListeners();
    } else if (response is ErrorResponse) {
      _setStatus('❌ Isolate error: ${response.error}', hasError: true);
      notifyListeners();
    }
  }

  /// Load configuration from storage
  Future<void> _loadConfiguration() async {
    try {
      _config = await _repo.loadConfig();
      // Don't trust the stored connection state, we'll check it properly
      _isScannerConnected = false;
      notifyListeners();
    } catch (e) {
      _setStatus('Failed to load configuration: $e', hasError: true);
    }
  }

  /// Check initial connectivity status
  Future<void> _checkInitialConnectivity() async {
    // Check API connectivity silently (don't show status messages during init)
    try {
      _isApiConnected = await _repo.testApiConnection();
    } catch (e) {
      _isApiConnected = false;
    }

    // For scanner, just set initial status - let user connect manually
    _isScannerConnected = false;

    // Update status based on connectivity only after initialization
    _updateConnectivityStatus(forceUpdate: true);
    notifyListeners();
  }

  /// Update connectivity status message (only if no specific status is set)
  void _updateConnectivityStatus({bool forceUpdate = false}) {
    // Only update status if we're not in the middle of an operation or if forced
    if (!forceUpdate && _isLoading) return;

    if (_isScannerConnected && _isApiConnected) {
      _setStatus('✅ All systems online - Ready for biometric scanning');
    } else if (_isScannerConnected && !_isApiConnected) {
      _setStatus(
        '⚠️ Scanner connected but API offline - Cannot perform matching',
      );
    } else if (!_isScannerConnected && _isApiConnected) {
      _setStatus(
        '⚠️ API connected but scanner offline - Connect scanner to capture fingerprints',
      );
    } else {
      _setStatus(
        '❌ All systems offline - Connect scanner and check API endpoint',
      );
    }
  }

  /// Refresh available serial ports
  Future<void> _refreshPorts() async {
    try {
      _portInfo = await _repo.getAvailablePorts();

      // Auto-select port if none selected and ports are available
      if (_config.port == null && _portInfo.availablePorts.isNotEmpty) {
        // Prioritize ports containing "usbserial"
        String? selectedPort = _portInfo.availablePorts
            .where((port) => port.toLowerCase().contains('usbserial'))
            .firstOrNull;

        // If no usbserial port found, fall back to first available port
        selectedPort ??= _portInfo.availablePorts.first;

        _config = _config.copyWith(port: selectedPort);
      }

      notifyListeners();
    } catch (e) {
      _setStatus('Failed to refresh ports: $e', hasError: true);
    }
  }

  /// Set status message with debouncing to prevent UI lag
  void _setStatus(
    String message, {
    bool hasError = false,
    bool isCapturing = false,
    bool immediate = false,
  }) {
    _status = ScannerStatus(
      message: message,
      hasError: hasError,
      isCapturing: isCapturing,
    );

    // Only notify listeners immediately for critical updates or if requested
    if (immediate || hasError || isCapturing) {
      notifyListeners();
    } else {
      // Debounce non-critical status updates
      _debounceTimer?.cancel();
      _debounceTimer = Timer(const Duration(milliseconds: 100), () {
        notifyListeners();
      });
    }
  }

  /// Update port selection
  void updatePort(String? port) {
    if (port != _config.port) {
      _config = _config.copyWith(port: port);
      notifyListeners();
    }
  }

  /// Update baud rate selection
  void updateBaudRate(int baudRate) {
    if (baudRate != _config.baudRate) {
      _config = _config.copyWith(baudRate: baudRate);
      notifyListeners();
    }
  }

  /// Connect to the scanner
  Future<void> connect() async {
    if (_config.port == null) {
      _setStatus('❌ No port selected', hasError: true);
      return;
    }

    if (_isLoading) return;

    _isLoading = true;
    _setStatus('🔌 Connecting to scanner...', immediate: true);

    // Run connection in background without blocking UI
    _connectAsync();
  }

  Future<void> _connectAsync() async {
    try {
      // Repository now handles yielding internally
      await _repo.connect(_config.port!, _config.baudRate);

      _config = _config.copyWith(isConnected: true);
      _isScannerConnected = true;
      _setStatus(
        '✅ Scanner connected to ${_config.port} at ${_config.baudRate} baud',
        immediate: true,
      );

      await _repo.saveConfig(_config);
      await _repo.log('Scanner connected successfully to ${_config.port}');
    } catch (e) {
      _isScannerConnected = false;
      String errorMessage = e.toString();

      // Provide more specific error messages
      if (errorMessage.contains('not available')) {
        _setStatus(
          '❌ Port ${_config.port} is not available. Check device connection.',
          hasError: true,
        );
      } else if (errorMessage.contains('Error accessing serial ports')) {
        _setStatus(
          '❌ Cannot access serial port. Check permissions and device connection.',
          hasError: true,
        );
      } else {
        _setStatus('❌ Scanner connection failed: $e', hasError: true);
      }

      await _repo.log('Connection error: $e');
    } finally {
      _isLoading = false;
      // Only notify once at the end
      notifyListeners();
    }
  }

  /// Disconnect from the scanner
  Future<void> disconnect() async {
    if (_isLoading) return;

    _isLoading = true;
    _setStatus('🔌 Disconnecting...', immediate: true);

    // Run disconnect in background
    _disconnectAsync();
  }

  Future<void> _disconnectAsync() async {
    try {
      // Use repository for scanner disconnect (now optimized with async yielding)
      await _repo.disconnect();

      _config = _config.copyWith(isConnected: false);
      _isScannerConnected = false;
      // Clear results when disconnecting scanner
      _lastCapturedImage = null;
      _lastMatchResult = null;
      _setStatus('🔌 Scanner disconnected');
    } catch (e) {
      _setStatus('❌ Disconnect failed: $e', hasError: true);
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  /// Set baud rate on the scanner module
  Future<void> setBaudRate(int newBaudRate) async {
    if (!_config.isConnected) {
      _setStatus('❌ Not connected', hasError: true);
      return;
    }

    if (_isLoading) return;

    _isLoading = true;
    _setStatus('Setting module baud rate to $newBaudRate...', immediate: true);

    // Run baud rate setting in background
    _setBaudRateAsync(newBaudRate);
  }

  Future<void> _setBaudRateAsync(int newBaudRate) async {
    try {
      // Use repository for baud rate setting (not heavy enough for isolate)
      await _repo.setBaudRate(newBaudRate);

      _config = _config.copyWith(baudRate: newBaudRate);
      _setStatus(
        '✅ Module baud set to $newBaudRate. Please reconnect after power-cycling the sensor.',
      );

      await _repo.saveConfig(_config);
      await disconnect();
    } catch (e) {
      _setStatus('❌ Failed to set baud rate: $e', hasError: true);
      await _repo.log('Set baud error: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  /// Capture fingerprint and match it
  Future<void> captureFingerprint() async {
    if (!_isScannerConnected) {
      _setStatus('❌ Scanner not connected', hasError: true);
      return;
    }

    if (!_isApiConnected) {
      _setStatus(
        '❌ API not connected - Cannot perform matching',
        hasError: true,
      );
      return;
    }

    if (_isLoading) {
      return;
    }

    // Reset previous results when starting new request
    _lastMatchResult = null;
    _lastCapturedImage = null;
    _isLoading = true;
    _setStatus('👆 Place finger on the sensor...', isCapturing: true);
    notifyListeners(); // Notify UI to clear previous results

    // Run capture in background without blocking UI
    _captureAsync();
  }

  Future<void> _captureAsync() async {
    try {
      // Repository now handles yielding internally
      final image = await _repo.captureFingerprint();
      _lastCapturedImage = image;

      _setStatus(
        '📸 Fingerprint captured! Sending for matching...',
        immediate: true,
      );

      // Use repository for fingerprint matching (now optimized with async yielding)
      final filename =
          'fingerprint_${DateTime.now().millisecondsSinceEpoch}.png';
      final result = await _repo.matchFingerprint(image.imageData, filename);
      _lastMatchResult = result;

      if (result.isMatch) {
        _setStatus(
          '✅ MATCH FOUND! Confidence: ${(result.confidence * 100).toStringAsFixed(1)}%',
          immediate: true,
        );
      } else {
        _setStatus(
          '❌ No match found. Confidence: ${(result.confidence * 100).toStringAsFixed(1)}%',
          immediate: true,
        );
      }
    } catch (e) {
      _setStatus('❌ Capture/Match failed: $e', hasError: true);
      await _repo.log('Capture/Match error: $e');
    } finally {
      _isLoading = false;
      // Only notify once at the end
      notifyListeners();
    }
  }

  /// Clear all results (captured image and match result)
  void clearResults() {
    _lastCapturedImage = null;
    _lastMatchResult = null;
    _setStatus('🧹 Results cleared', immediate: true);
    notifyListeners();
  }

  /// Clear configuration
  Future<void> clearConfig() async {
    if (_isLoading) return;

    _isLoading = true;
    _setStatus('🧹 Clearing configuration...', immediate: true);

    // Run config clearing in background
    _clearConfigAsync();
  }

  Future<void> _clearConfigAsync() async {
    try {
      // Use repository for config clearing (not heavy enough for isolate)
      await _repo.clearConfig();

      _config = const FingerprintScannerConfig();
      _lastCapturedImage = null;
      _lastMatchResult = null; // Also clear match results
      _setStatus('🧹 Configuration reset');
    } catch (e) {
      _setStatus('❌ Failed to reset config: $e', hasError: true);
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  /// Refresh ports manually
  Future<void> refreshPorts() async {
    if (_isLoading) return;

    _setStatus('🔄 Refreshing available ports...', immediate: true);

    // Run port refresh in background
    _refreshPortsAsync();
  }

  Future<void> _refreshPortsAsync() async {
    try {
      await _refreshPorts();

      if (_portInfo.availablePorts.isEmpty) {
        _setStatus(
          '⚠️ No serial ports found. Connect your scanner device.',
          hasError: true,
        );
      } else {
        _setStatus(
          '✅ Found ${_portInfo.availablePorts.length} available port(s)',
        );
      }
    } catch (e) {
      _setStatus('❌ Failed to refresh ports: $e', hasError: true);
    }
  }

  /// Load API endpoint from storage
  Future<void> _loadApiEndpoint() async {
    // Run in background to avoid blocking UI
    _loadApiEndpointAsync();
  }

  Future<void> _loadApiEndpointAsync() async {
    _currentApiEndpoint = await FingerprintConfig.getApiEndpoint();
    notifyListeners();
  }

  /// Update API endpoint
  Future<void> updateApiEndpoint(String newEndpoint) async {
    if (_isLoading) return;

    _isLoading = true;
    _setStatus('🔄 Updating API endpoint...', immediate: true);

    // Run API endpoint update in background
    _updateApiEndpointAsync(newEndpoint);
  }

  Future<void> _updateApiEndpointAsync(String newEndpoint) async {
    try {
      await FingerprintConfig.setApiEndpoint(newEndpoint);
      _currentApiEndpoint = newEndpoint;

      // Recreate the API service with the new endpoint
      if (_isolatedRepo != null) {
        final dio = Dio();
        final newApiService = FingerprintApiService(
          dio: dio,
          baseUrl: newEndpoint,
        );
        _isolatedRepo = IsolatedFingerprintScannerRepo(
          apiService: newApiService,
        );
        _repo = _isolatedRepo!;

        // Re-setup isolate listener
        _isolatedRepo!.responseStream.listen((response) {
          _handleIsolateResponse(response);
        });
      }

      _setStatus('✅ API endpoint updated');
    } catch (e) {
      _setStatus('❌ Failed to update API endpoint: $e', hasError: true);
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  /// Test API connection
  Future<void> testApiConnection() async {
    if (_isLoading) return;

    _isLoading = true;
    _setStatus('🌐 Testing API connection...', immediate: true);

    // Run API test in background
    _testApiAsync();
  }

  Future<void> _testApiAsync() async {
    try {
      // Use repository for API connection test (now optimized with async yielding)
      _isApiConnected = await _repo.testApiConnection();

      if (_isApiConnected) {
        _setStatus('✅ API connection successful');
        await _repo.log('API connection test successful');
      } else {
        _setStatus('❌ API connection failed', hasError: true);
        await _repo.log('API connection test failed');
      }
    } catch (e) {
      _isApiConnected = false;
      _setStatus('❌ API test failed: $e', hasError: true);
      await _repo.log('API connection test error: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  @override
  void dispose() {
    _debounceTimer?.cancel();
    _repo.disconnect();
    _isolatedRepo?.dispose();
    super.dispose();
  }
}
