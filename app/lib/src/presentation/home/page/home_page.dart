import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:hackathon/src/core/config/fingerprint_config.dart';
import 'package:hackathon/src/data/repository/isolated_fingerprint_scanner_repo.dart';
import 'package:hackathon/src/data/service/fingerprint_api_service.dart';
import 'package:hackathon/src/presentation/home/controller/fingerprint_scanner_controller.dart';
import 'package:hackathon/src/presentation/home/widget/cyberpunk_fingerprint_scanner.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  FingerprintScannerController? _controller;
  bool _isInitializing = true;

  @override
  void initState() {
    super.initState();
    _initializeController();
  }

  Future<void> _initializeController() async {
    try {
      final apiEndpoint = await FingerprintConfig.getApiEndpoint();

      final dio = Dio();
      final apiService = FingerprintApiService(dio: dio, baseUrl: apiEndpoint);

      final repo = IsolatedFingerprintScannerRepo(apiService: apiService);

      _controller = FingerprintScannerController(repo);

      if (mounted) {
        setState(() {
          _isInitializing = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _isInitializing = false;
        });
      }
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_isInitializing) {
      return Scaffold(
        backgroundColor: const Color(0xFF0A0A0A),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircularProgressIndicator(color: Color(0xFF00FFFF)),
              const SizedBox(height: 16),
              Text(
                'INITIALIZING NEURAL SCANNER...',
                style: TextStyle(
                  color: const Color(0xFF00FFFF),
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1.0,
                ),
              ),
            ],
          ),
        ),
      );
    }

    if (_controller == null) {
      return Scaffold(
        backgroundColor: const Color(0xFF0A0A0A),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.error, size: 64, color: Color(0xFFFF0033)),
              const SizedBox(height: 16),
              Text(
                'NEURAL SCANNER INITIALIZATION FAILED',
                style: TextStyle(
                  color: const Color(0xFFFF0033),
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1.0,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      );
    }

    return CyberpunkFingerprintScanner(controller: _controller!);
  }
}
