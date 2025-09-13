import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:hackathon/src/design/components/cyberpunk_components.dart';
import 'package:hackathon/src/design/theme/cyberpunk_palette.dart';
import 'package:hackathon/src/design/theme/custom_theme.dart';
import 'package:hackathon/src/design/theme/theme_text_styles.dart';
import 'package:hackathon/src/design/widget/theme_switch.dart';
import 'package:hackathon/src/presentation/home/controller/fingerprint_scanner_controller.dart';
import 'package:hackathon/src/presentation/home/widget/cyberpunk_fingerprint_preview.dart';
import 'package:hackathon/src/presentation/home/widget/cyberpunk_settings_dialog.dart';

class CyberpunkFingerprintScanner extends StatefulWidget {
  final FingerprintScannerController controller;

  const CyberpunkFingerprintScanner({super.key, required this.controller});

  @override
  State<CyberpunkFingerprintScanner> createState() =>
      _CyberpunkFingerprintScannerState();
}

class _CyberpunkFingerprintScannerState
    extends State<CyberpunkFingerprintScanner>
    with TickerProviderStateMixin {
  late AnimationController _scanController;
  late AnimationController _pulseController;
  late AnimationController _glitchController;
  late Animation<double> _scanAnimation;
  late Animation<double> _pulseAnimation;
  late Animation<double> _glitchAnimation;

  @override
  void initState() {
    super.initState();

    _scanController = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );

    _pulseController = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );

    _glitchController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );

    _scanAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _scanController, curve: Curves.easeInOut),
    );

    _pulseAnimation = Tween<double>(begin: 0.8, end: 1.2).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut),
    );

    _glitchAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _glitchController, curve: Curves.elasticOut),
    );

    widget.controller.addListener(_onControllerChange);
  }

  @override
  void dispose() {
    widget.controller.removeListener(_onControllerChange);
    _scanController.dispose();
    _pulseController.dispose();
    _glitchController.dispose();
    super.dispose();
  }

  void _onControllerChange() {
    if (widget.controller.status.isCapturing) {
      if (!_scanController.isAnimating) {
        _scanController.repeat();
      }
      if (!_pulseController.isAnimating) {
        _pulseController.repeat(reverse: true);
      }
    } else {
      if (_scanController.isAnimating) {
        _scanController.stop();
        _scanController.reset();
      }
      if (_pulseController.isAnimating) {
        _pulseController.stop();
        _pulseController.reset();
      }
    }

    if (widget.controller.status.hasError && !_glitchController.isAnimating) {
      _glitchController.forward().then((_) => _glitchController.reverse());
    }
  }

  @override
  Widget build(BuildContext context) {
    return CyberpunkBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: _buildAppBar(),
        body: ListenableBuilder(
          listenable: widget.controller,
          builder: (context, child) {
            return LayoutBuilder(
              builder: (context, constraints) {
                if (constraints.maxWidth > 1200) {
                  return Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 1,
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                _buildStatusPanel(),
                                if (widget.controller.lastMatchResult !=
                                    null) ...[
                                  const SizedBox(height: 20),
                                  _buildMatchResult(),
                                ],
                                if (widget.controller.lastCapturedImage !=
                                    null) ...[
                                  const SizedBox(height: 20),
                                  CyberpunkFingerprintPreview(
                                    image: widget.controller.lastCapturedImage!,
                                  ),
                                ],
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          flex: 2,
                          child: ListView(
                            children: [
                              _buildHeader(),
                              const SizedBox(height: 20),
                              _buildScannerInterface(),
                              const SizedBox(height: 20),
                              _buildControlPanel(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                } else if (constraints.maxWidth > 800) {
                  return Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        _buildHeader(),
                        const SizedBox(height: 20),
                        Expanded(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      _buildStatusPanel(),
                                      if (widget.controller.lastMatchResult !=
                                          null) ...[
                                        const SizedBox(height: 20),
                                        _buildMatchResult(),
                                      ],
                                      if (widget.controller.lastCapturedImage !=
                                          null) ...[
                                        const SizedBox(height: 20),
                                        CyberpunkFingerprintPreview(
                                          image: widget
                                              .controller
                                              .lastCapturedImage!,
                                        ),
                                      ],
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(width: 20),
                              Expanded(
                                child: Column(
                                  children: [
                                    _buildScannerInterface(),
                                    const SizedBox(height: 20),
                                    _buildControlPanel(),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                } else {
                  return SingleChildScrollView(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        _buildHeader(),
                        const SizedBox(height: 30),
                        _buildScannerInterface(),
                        const SizedBox(height: 30),
                        _buildControlPanel(),
                        const SizedBox(height: 30),
                        _buildStatusPanel(),
                        if (widget.controller.lastMatchResult != null) ...[
                          const SizedBox(height: 30),
                          _buildMatchResult(),
                        ],
                        if (widget.controller.lastCapturedImage != null) ...[
                          const SizedBox(height: 30),
                          CyberpunkFingerprintPreview(
                            image: widget.controller.lastCapturedImage!,
                          ),
                        ],
                      ],
                    ),
                  );
                }
              },
            );
          },
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Text(
        'NEURAL SCANNER',
        style: ThemeTextStyles.heading(context).copyWith(fontSize: 24),
      ),
      centerTitle: true,
      actions: [
        const ThemeToggleButton(),
        const SizedBox(width: 8),
        IconButton(
          onPressed: () => _showSettingsDialog(),
          icon: const Icon(Icons.settings, color: CyberpunkPalette.neonCyan),
        ),
      ],
    );
  }

  Widget _buildHeader() {
    return CyberpunkCard(
      glowColor: CyberpunkPalette.neonCyan,
      child: Column(
        children: [
          Text(
            'BIOMETRIC IDENTIFICATION',
            style: ThemeTextStyles.heading(context).copyWith(fontSize: 28),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Text(
            'Advanced Neural Pattern Recognition System',
            style: ThemeTextStyles.body(context),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          _buildConnectionStatus(),
        ],
      ),
    );
  }

  Widget _buildConnectionStatus() {
    final isFullyConnected = widget.controller.isConnected;
    final isScannerConnected = widget.controller.isScannerConnected;
    final isApiConnected = widget.controller.isApiConnected;

    return Column(
      children: [
        AnimatedBuilder(
          animation: _pulseAnimation,
          builder: (context, child) {
            return Transform.scale(
              scale: isFullyConnected ? _pulseAnimation.value : 1.0,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: isFullyConnected
                      ? CyberpunkPalette.success.withOpacity(0.2)
                      : CyberpunkPalette.error.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: isFullyConnected
                        ? CyberpunkPalette.success
                        : CyberpunkPalette.error,
                    width: 2,
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color: isFullyConnected
                            ? CyberpunkPalette.success
                            : CyberpunkPalette.error,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color:
                                (isFullyConnected
                                        ? CyberpunkPalette.success
                                        : CyberpunkPalette.error)
                                    .withOpacity(0.6),
                            blurRadius: 8,
                            spreadRadius: 2,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      isFullyConnected
                          ? 'ALL SYSTEMS ONLINE'
                          : 'SYSTEMS OFFLINE',
                      style: ThemeTextStyles.matrix(context).copyWith(
                        color: isFullyConnected
                            ? CyberpunkPalette.success
                            : CyberpunkPalette.error,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
        const SizedBox(height: 12),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildStatusIndicator(
              'SCANNER',
              isScannerConnected,
              Icons.fingerprint,
            ),
            _buildStatusIndicator('API', isApiConnected, Icons.cloud),
          ],
        ),
      ],
    );
  }

  Widget _buildStatusIndicator(String label, bool isConnected, IconData icon) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: isConnected
            ? CyberpunkPalette.success.withOpacity(0.1)
            : CyberpunkPalette.error.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isConnected
              ? CyberpunkPalette.success
              : CyberpunkPalette.error,
          width: 1,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 14,
            color: isConnected
                ? CyberpunkPalette.success
                : CyberpunkPalette.error,
          ),
          const SizedBox(width: 6),
          Text(
            label,
            style: CyberpunkTextStyles.matrix.copyWith(
              color: isConnected
                  ? CyberpunkPalette.success
                  : CyberpunkPalette.error,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildScannerInterface() {
    return CyberpunkCard(
      width: double.infinity,
      glowColor: widget.controller.status.isCapturing
          ? CyberpunkPalette.neonCyan
          : CyberpunkPalette.neonPink,
      child: Column(
        children: [
          Text(
            'NEURAL SCAN INTERFACE',
            style: CyberpunkTextStyles.subheading,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 30),
          _buildScannerVisualization(),
          const SizedBox(height: 30),
          _buildScanButton(),
        ],
      ),
    );
  }

  Widget _buildScannerVisualization() {
    return AnimatedBuilder(
      animation: Listenable.merge([_scanAnimation, _pulseAnimation]),
      builder: (context, child) {
        final screenWidth = MediaQuery.of(context).size.width;
        final scannerSize = screenWidth > 1200
            ? 320.0
            : screenWidth > 800
            ? 280.0
            : 240.0;

        return Container(
          width: scannerSize,
          height: scannerSize,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: CyberpunkPalette.neonCyan, width: 4),
            boxShadow: [
              BoxShadow(
                color: CyberpunkPalette.cyanGlow,
                blurRadius: 30,
                spreadRadius: 8,
              ),
            ],
          ),
          child: Stack(
            children: [
              if (widget.controller.status.isCapturing)
                CustomPaint(
                  painter: ScanningBeamPainter(_scanAnimation.value),
                  size: Size(scannerSize, scannerSize),
                ),

              Center(
                child: AnimatedBuilder(
                  animation: _pulseAnimation,
                  builder: (context, child) {
                    final iconSize = scannerSize * 0.4;
                    return Transform.scale(
                      scale: _pulseAnimation.value,
                      child: Icon(
                        Icons.fingerprint,
                        size: iconSize,
                        color: widget.controller.status.isCapturing
                            ? CyberpunkPalette.neonCyan
                            : CyberpunkPalette.neonPink,
                      ),
                    );
                  },
                ),
              ),

              Positioned(
                bottom: 30,
                left: 0,
                right: 0,
                child: Text(
                  widget.controller.status.isCapturing
                      ? 'SCANNING...'
                      : 'READY TO SCAN',
                  style: CyberpunkTextStyles.matrix.copyWith(fontSize: 16),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildScanButton() {
    final canScan =
        widget.controller.isConnected && !widget.controller.isLoading;
    final isCapturing = widget.controller.status.isCapturing;

    String buttonText;
    IconData buttonIcon;
    Color glowColor;

    if (isCapturing) {
      buttonText = 'SCANNING IN PROGRESS';
      buttonIcon = Icons.radar;
      glowColor = CyberpunkPalette.neonCyan;
    } else if (!widget.controller.isScannerConnected) {
      buttonText = 'CONNECT SCANNER FIRST';
      buttonIcon = Icons.link_off;
      glowColor = CyberpunkPalette.error;
    } else if (!widget.controller.isApiConnected) {
      buttonText = 'CONNECT API FIRST';
      buttonIcon = Icons.cloud_off;
      glowColor = CyberpunkPalette.error;
    } else {
      buttonText = 'INITIATE NEURAL SCAN';
      buttonIcon = Icons.fingerprint;
      glowColor = CyberpunkPalette.neonPink;
    }

    return CyberpunkButton(
      text: buttonText,
      icon: buttonIcon,
      onPressed: canScan ? widget.controller.captureFingerprint : null,
      isLoading: isCapturing,
      glowColor: glowColor,
    );
  }

  Widget _buildControlPanel() {
    return CyberpunkCard(
      width: double.infinity,
      glowColor: CyberpunkPalette.neonPurple,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 22.3),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('SYSTEM CONTROLS', style: CyberpunkTextStyles.subheading),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 12,
              children: [
                CyberpunkButton(
                  text: widget.controller.isScannerConnected
                      ? 'DISCONNECT SCANNER'
                      : 'CONNECT SCANNER',
                  icon: widget.controller.isScannerConnected
                      ? Icons.link_off
                      : Icons.link,
                  onPressed: widget.controller.isLoading
                      ? null
                      : (widget.controller.isScannerConnected
                            ? widget.controller.disconnect
                            : widget.controller.connect),
                  glowColor: widget.controller.isScannerConnected
                      ? CyberpunkPalette.error
                      : CyberpunkPalette.success,
                ),
                CyberpunkButton(
                  text: 'REFRESH PORTS',
                  icon: Icons.refresh,
                  onPressed: widget.controller.isLoading
                      ? null
                      : widget.controller.refreshPorts,
                  glowColor: CyberpunkPalette.neonBlue,
                ),
                CyberpunkButton(
                  text: widget.controller.isApiConnected
                      ? 'API CONNECTED'
                      : 'TEST API CONNECTION',
                  icon: widget.controller.isApiConnected
                      ? Icons.cloud_done
                      : Icons.cloud,
                  onPressed: widget.controller.isLoading
                      ? null
                      : widget.controller.testApiConnection,
                  glowColor: widget.controller.isApiConnected
                      ? CyberpunkPalette.success
                      : CyberpunkPalette.neonPurple,
                ),
                const SizedBox(height: 12),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusPanel() {
    return CyberpunkCard(
      glowColor: widget.controller.status.hasError
          ? CyberpunkPalette.error
          : CyberpunkPalette.neonGreen,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                widget.controller.status.hasError ? Icons.warning : Icons.info,
                color: widget.controller.status.hasError
                    ? CyberpunkPalette.error
                    : CyberpunkPalette.neonGreen,
              ),
              const SizedBox(width: 8),
              Text('SYSTEM STATUS', style: CyberpunkTextStyles.subheading),
            ],
          ),
          const SizedBox(height: 16),
          AnimatedBuilder(
            animation: _glitchAnimation,
            builder: (context, child) {
              return Transform.translate(
                offset: widget.controller.status.hasError
                    ? Offset(
                        (math.Random().nextDouble() - 0.5) *
                            4 *
                            _glitchAnimation.value,
                        (math.Random().nextDouble() - 0.5) *
                            4 *
                            _glitchAnimation.value,
                      )
                    : Offset.zero,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.controller.status.message,
                      style: ThemeTextStyles.body(context).copyWith(
                        color: widget.controller.status.hasError
                            ? CyberpunkPalette.error
                            : Theme.of(
                                context,
                              ).extension<CustomTheme>()!.white70,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Debug: Scanner=${widget.controller.isScannerConnected}, API=${widget.controller.isApiConnected}, Loading=${widget.controller.isLoading}',
                      style: ThemeTextStyles.body(context).copyWith(
                        color: Theme.of(
                          context,
                        ).extension<CustomTheme>()!.white50,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildMatchResult() {
    final result = widget.controller.lastMatchResult!;
    return CyberpunkCard(
      glowColor: result.isMatch
          ? CyberpunkPalette.success
          : CyberpunkPalette.error,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                result.isMatch ? Icons.verified : Icons.cancel,
                color: result.isMatch
                    ? CyberpunkPalette.success
                    : CyberpunkPalette.error,
                size: 32,
              ),
              const SizedBox(width: 12),
              Text(
                result.isMatch ? 'IDENTITY VERIFIED' : 'IDENTITY REJECTED',
                style: CyberpunkTextStyles.glitch.copyWith(
                  color: result.isMatch
                      ? CyberpunkPalette.success
                      : CyberpunkPalette.error,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          CyberpunkProgressBar(
            value: result.confidence,
            color: result.isMatch
                ? CyberpunkPalette.success
                : CyberpunkPalette.error,
            label: 'NEURAL MATCH CONFIDENCE',
          ),
          const SizedBox(height: 16),
          Text(
            '${(result.confidence * 100).toStringAsFixed(1)}%',
            style: CyberpunkTextStyles.heading.copyWith(
              color: result.isMatch
                  ? CyberpunkPalette.success
                  : CyberpunkPalette.error,
            ),
          ),
        ],
      ),
    );
  }

  void _showSettingsDialog() {
    showDialog(
      context: context,
      builder: (context) =>
          CyberpunkSettingsDialog(controller: widget.controller),
    );
  }
}

class ScanningBeamPainter extends CustomPainter {
  final double animationValue;

  ScanningBeamPainter(this.animationValue);

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2 - 15;

    final paint = Paint()
      ..shader = RadialGradient(
        colors: [
          CyberpunkPalette.neonCyan.withOpacity(0.8),
          CyberpunkPalette.neonCyan.withOpacity(0.4),
          Colors.transparent,
        ],
        stops: const [0.0, 0.7, 1.0],
      ).createShader(Rect.fromCircle(center: center, radius: radius));

    final sweepAngle = 2 * math.pi * animationValue;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -math.pi / 2,
      sweepAngle,
      true,
      paint,
    );

    final linePaint = Paint()
      ..color = CyberpunkPalette.neonCyan
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke;

    final lineAngle = -math.pi / 2 + sweepAngle;
    final lineStart = Offset(
      center.dx + math.cos(lineAngle) * (radius - 25),
      center.dy + math.sin(lineAngle) * (radius - 25),
    );
    final lineEnd = Offset(
      center.dx + math.cos(lineAngle) * (radius + 15),
      center.dy + math.sin(lineAngle) * (radius + 15),
    );

    canvas.drawLine(lineStart, lineEnd, linePaint);
  }

  @override
  bool shouldRepaint(ScanningBeamPainter oldDelegate) => true;
}
