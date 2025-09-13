import 'dart:typed_data';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:image/image.dart' as img;
import 'package:hackathon/src/design/components/cyberpunk_components.dart';
import 'package:hackathon/src/design/theme/cyberpunk_palette.dart';
import 'package:hackathon/src/domain/entities/fingerprint_scanner.dart';

/// Cyberpunk-styled fingerprint image preview with holographic effects
class CyberpunkFingerprintPreview extends StatefulWidget {
  final FingerprintImage image;

  const CyberpunkFingerprintPreview({super.key, required this.image});

  @override
  State<CyberpunkFingerprintPreview> createState() =>
      _CyberpunkFingerprintPreviewState();
}

class _CyberpunkFingerprintPreviewState
    extends State<CyberpunkFingerprintPreview>
    with TickerProviderStateMixin {
  late AnimationController _hologramController;
  late AnimationController _scanController;
  late Animation<double> _hologramAnimation;
  late Animation<double> _scanAnimation;

  @override
  void initState() {
    super.initState();

    _hologramController = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat();

    _scanController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat();

    _hologramAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _hologramController, curve: Curves.easeInOut),
    );

    _scanAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(parent: _scanController, curve: Curves.linear));
  }

  @override
  void dispose() {
    _hologramController.dispose();
    _scanController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CyberpunkCard(
      glowColor: CyberpunkPalette.neonCyan,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FittedBox(
            child: Row(
              children: [
                Icon(
                  Icons.fingerprint,
                  color: CyberpunkPalette.neonCyan,
                  size: 24,
                ),
                const SizedBox(width: 8),
                Text(
                  'NEURAL PATTERN CAPTURED',
                  style: CyberpunkTextStyles.subheading,
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Center(child: _buildHolographicImage()),
          const SizedBox(height: 16),
          _buildImageInfo(),
        ],
      ),
    );
  }

  Widget _buildHolographicImage() {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Image.memory(
            _convertToDisplayable(widget.image.imageData),
            fit: BoxFit.contain,
            width: 250,
            height: 280,
          ),
        ),
        AnimatedBuilder(
          animation: Listenable.merge([_hologramAnimation, _scanAnimation]),
          builder: (context, child) {
            return Container(
              width: 250,
              height: 280,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: CyberpunkPalette.neonCyan, width: 2),
                boxShadow: [
                  BoxShadow(
                    color: CyberpunkPalette.cyanGlow,
                    blurRadius: 20,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(14),
                child: Stack(
                  children: [
                    // Holographic overlay
                    CustomPaint(
                      painter: HolographicOverlayPainter(
                        _hologramAnimation.value,
                        _scanAnimation.value,
                      ),
                      size: const Size(250, 280),
                    ),

                    // Scanning lines
                    CustomPaint(
                      painter: ScanningLinesPainter(_scanAnimation.value),
                      size: const Size(250, 280),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _buildImageInfo() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: CyberpunkPalette.darkSurface.withOpacity(0.5),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: CyberpunkPalette.neonCyan.withOpacity(0.3),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildInfoRow('Resolution', '256x288 pixels'),
          const SizedBox(height: 8),
          _buildInfoRow('Format', 'Grayscale PNG'),
          const SizedBox(height: 8),
          _buildInfoRow('Size', '${widget.image.imageData.length} bytes'),
          const SizedBox(height: 8),
          _buildInfoRow('Timestamp', _formatTimestamp(widget.image.capturedAt)),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: CyberpunkTextStyles.matrix.copyWith(
            color: CyberpunkPalette.textMuted,
          ),
        ),
        Text(value, style: CyberpunkTextStyles.matrix),
      ],
    );
  }

  String _formatTimestamp(DateTime timestamp) {
    return '${timestamp.hour.toString().padLeft(2, '0')}:'
        '${timestamp.minute.toString().padLeft(2, '0')}:'
        '${timestamp.second.toString().padLeft(2, '0')}';
  }

  Uint8List _convertToDisplayable(Uint8List grayscaleData) {
    // Convert grayscale to PNG for display
    const width = 256;
    const height = 288;

    final image = img.Image.fromBytes(
      width: width,
      height: height,
      bytes: grayscaleData.buffer,
      format: img.Format.uint8,
      numChannels: 1,
    );

    return Uint8List.fromList(img.encodePng(image));
  }
}

/// Holographic overlay painter for the fingerprint image
class HolographicOverlayPainter extends CustomPainter {
  final double hologramValue;
  final double scanValue;

  HolographicOverlayPainter(this.hologramValue, this.scanValue);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..style = PaintingStyle.fill;

    // Create holographic scan lines
    for (int i = 0; i < 20; i++) {
      final y = (i * size.height / 20 + scanValue * size.height) % size.height;
      final opacity =
          (0.1 + math.sin(hologramValue * math.pi * 2 + i * 0.5) * 0.1);

      paint.color = CyberpunkPalette.neonCyan.withOpacity(opacity * 2);
      canvas.drawRect(Rect.fromLTWH(0, y, size.width, 2), paint);
    }

    // Add some glitch effects
    if (hologramValue > 0.8) {
      final glitchPaint = Paint()
        ..color = CyberpunkPalette.neonPink.withOpacity(0.3)
        ..style = PaintingStyle.fill;

      for (int i = 0; i < 5; i++) {
        final x = math.Random(i).nextDouble() * size.width;
        final y = math.Random(i + 1).nextDouble() * size.height;
        final width = 2 + math.Random(i + 2).nextDouble() * 4;
        final height = 20 + math.Random(i + 3).nextDouble() * 40;

        canvas.drawRect(Rect.fromLTWH(x, y, width, height), glitchPaint);
      }
    }
  }

  @override
  bool shouldRepaint(HolographicOverlayPainter oldDelegate) => true;
}

/// Scanning lines painter for the fingerprint image
class ScanningLinesPainter extends CustomPainter {
  final double scanValue;

  ScanningLinesPainter(this.scanValue);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = CyberpunkPalette.neonCyan.withOpacity(0.3)
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    // Main scanning line
    final scanY = scanValue * size.height;
    canvas.drawLine(Offset(0, scanY), Offset(size.width, scanY), paint);

    // Scanning line glow
    final glowPaint = Paint()
      ..shader = LinearGradient(
        colors: [
          Colors.transparent,
          CyberpunkPalette.neonCyan.withOpacity(0.4),
          Colors.transparent,
        ],
        stops: const [0.0, 0.5, 1.0],
      ).createShader(Rect.fromLTWH(0, scanY - 10, size.width, 20));

    canvas.drawRect(Rect.fromLTWH(0, scanY - 10, size.width, 20), glowPaint);
  }

  @override
  bool shouldRepaint(ScanningLinesPainter oldDelegate) => true;
}
