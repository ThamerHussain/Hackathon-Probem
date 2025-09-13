import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:hackathon/src/design/theme/cyberpunk_palette.dart';
import 'package:hackathon/src/design/theme/custom_theme.dart';

class CyberpunkBackground extends StatefulWidget {
  final Widget child;
  final bool showMatrix;

  const CyberpunkBackground({
    super.key,
    required this.child,
    this.showMatrix = true,
  });

  @override
  State<CyberpunkBackground> createState() => _CyberpunkBackgroundState();
}

class _CyberpunkBackgroundState extends State<CyberpunkBackground>
    with TickerProviderStateMixin {
  late AnimationController _gridController;
  late AnimationController _matrixController;
  late Animation<double> _gridAnimation;
  late Animation<double> _matrixAnimation;

  @override
  void initState() {
    super.initState();
    _gridController = AnimationController(
      duration: const Duration(seconds: 12),
      vsync: this,
    )..repeat();

    _matrixController = AnimationController(
      duration: const Duration(seconds: 10),
      vsync: this,
    )..repeat();

    _gridAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(parent: _gridController, curve: Curves.linear));

    _matrixAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(parent: _matrixController, curve: Curves.linear));
  }

  @override
  void dispose() {
    _gridController.dispose();
    _matrixController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final customTheme = theme.extension<CustomTheme>()!;

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [customTheme.darkGrey, customTheme.grey800],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Stack(
        children: [
          if (widget.showMatrix) _buildMatrixEffect(),
          _buildGridEffect(),
          _buildParticles(),
          widget.child,
        ],
      ),
    );
  }

  Widget _buildMatrixEffect() {
    return AnimatedBuilder(
      animation: _matrixAnimation,
      builder: (context, child) {
        return CustomPaint(
          painter: MatrixPainter(_matrixAnimation.value),
          size: Size.infinite,
        );
      },
    );
  }

  Widget _buildGridEffect() {
    return AnimatedBuilder(
      animation: _gridAnimation,
      builder: (context, child) {
        return CustomPaint(
          painter: GridPainter(_gridAnimation.value),
          size: Size.infinite,
        );
      },
    );
  }

  Widget _buildParticles() {
    return AnimatedBuilder(
      animation: _gridAnimation,
      builder: (context, child) {
        return CustomPaint(
          painter: ParticlePainter(_gridAnimation.value),
          size: Size.infinite,
        );
      },
    );
  }
}

class MatrixPainter extends CustomPainter {
  final double animationValue;

  MatrixPainter(this.animationValue);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = CyberpunkPalette.matrixGreen
      ..style = PaintingStyle.fill;

    final random = math.Random(42); // Fixed seed for consistent effect

    for (int i = 0; i < 15; i++) {
      final x = random.nextDouble() * size.width;
      final y =
          (random.nextDouble() * size.height + animationValue * size.height) %
          size.height;
      final opacity = (1 - (y / size.height)) * 0.6;

      paint.color = CyberpunkPalette.matrixGreen.withOpacity(opacity);
      canvas.drawRect(Rect.fromLTWH(x, y, 2, 8), paint);
    }
  }

  @override
  bool shouldRepaint(MatrixPainter oldDelegate) => true;
}

class GridPainter extends CustomPainter {
  final double animationValue;

  GridPainter(this.animationValue);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = CyberpunkPalette.neonCyan.withOpacity(0.1)
      ..strokeWidth = 1.0
      ..style = PaintingStyle.stroke;

    const gridSize = 50.0;
    final offset = animationValue * gridSize;

    for (double x = -offset; x < size.width + gridSize; x += gridSize) {
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), paint);
    }

    for (double y = -offset; y < size.height + gridSize; y += gridSize) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), paint);
    }
  }

  @override
  bool shouldRepaint(GridPainter oldDelegate) => true;
}

class ParticlePainter extends CustomPainter {
  final double animationValue;

  ParticlePainter(this.animationValue);

  @override
  void paint(Canvas canvas, Size size) {
    final random = math.Random(123);
    final paint = Paint()..style = PaintingStyle.fill;

    for (int i = 0; i < 6; i++) {
      final x = random.nextDouble() * size.width;
      final y = random.nextDouble() * size.height;
      final radius = 1 + random.nextDouble() * 2;
      final opacity = 0.2 + random.nextDouble() * 0.3;

      paint.color = CyberpunkPalette.neonCyan.withOpacity(opacity);
      canvas.drawCircle(Offset(x, y), radius, paint);
    }
  }

  @override
  bool shouldRepaint(ParticlePainter oldDelegate) => true;
}

class CyberpunkCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final double? width;
  final double? height;
  final Color? glowColor;
  final BorderRadiusGeometry borderRadius;

  const CyberpunkCard({
    super.key,
    required this.child,
    this.padding,
    this.width,
    this.height,
    this.glowColor,
    this.borderRadius = const BorderRadius.all(Radius.circular(16)),
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final customTheme = theme.extension<CustomTheme>()!;

    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: customTheme.grey800.withOpacity(0.3),
        borderRadius: borderRadius,
        border: Border.all(color: customTheme.grey600, width: 1),
        boxShadow: [
          BoxShadow(
            color: (glowColor ?? customTheme.primary).withOpacity(0.3),
            blurRadius: 20,
            spreadRadius: 2,
          ),
          BoxShadow(
            color: customTheme.grey800.withOpacity(0.1),
            blurRadius: 10,
            spreadRadius: 1,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: padding ?? const EdgeInsets.all(20),
          child: child,
        ),
      ),
    );
  }
}

class CyberpunkButton extends StatefulWidget {
  final String text;
  final VoidCallback? onPressed;
  final IconData? icon;
  final Color? glowColor;
  final bool isLoading;
  final double? width;

  const CyberpunkButton({
    super.key,
    required this.text,
    this.onPressed,
    this.icon,
    this.glowColor,
    this.isLoading = false,
    this.width,
  });

  @override
  State<CyberpunkButton> createState() => _CyberpunkButtonState();
}

class _CyberpunkButtonState extends State<CyberpunkButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _glowAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);

    _glowAnimation = Tween<double>(
      begin: 0.3,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _glowAnimation,
      builder: (context, child) {
        return Container(
          width: widget.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: (widget.glowColor ?? CyberpunkPalette.neonCyan)
                    .withOpacity(_glowAnimation.value * 0.6),
                blurRadius: 20,
                spreadRadius: 2,
              ),
            ],
          ),
          child: ElevatedButton(
            onPressed: widget.isLoading ? null : widget.onPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: CyberpunkPalette.darkCard,
              foregroundColor: CyberpunkPalette.textPrimary,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: BorderSide(
                  color: widget.glowColor ?? CyberpunkPalette.neonCyan,
                  width: 2,
                ),
              ),
              elevation: 0,
            ),
            child: widget.isLoading
                ? SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      valueColor: AlwaysStoppedAnimation<Color>(
                        widget.glowColor ?? CyberpunkPalette.neonCyan,
                      ),
                    ),
                  )
                : Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (widget.icon != null) ...[
                        Icon(
                          widget.icon,
                          color: widget.glowColor ?? CyberpunkPalette.neonCyan,
                          size: 18,
                        ),
                        const SizedBox(width: 6),
                      ],
                      Flexible(
                        child: Text(
                          widget.text,
                          style: CyberpunkTextStyles.neon.copyWith(
                            fontSize: 14,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
          ),
        );
      },
    );
  }
}

class CyberpunkProgressBar extends StatefulWidget {
  final double value;
  final Color? color;
  final double height;
  final String? label;

  const CyberpunkProgressBar({
    super.key,
    required this.value,
    this.color,
    this.height = 8.0,
    this.label,
  });

  @override
  State<CyberpunkProgressBar> createState() => _CyberpunkProgressBarState();
}

class _CyberpunkProgressBarState extends State<CyberpunkProgressBar>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );

    _animation = Tween<double>(
      begin: 0,
      end: widget.value,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic));

    _controller.forward();
  }

  @override
  void didUpdateWidget(CyberpunkProgressBar oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.value != widget.value) {
      _animation = Tween<double>(begin: oldWidget.value, end: widget.value)
          .animate(
            CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic),
          );
      _controller.reset();
      _controller.forward();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label != null) ...[
          Text(widget.label!, style: CyberpunkTextStyles.matrix),
          const SizedBox(height: 8),
        ],
        AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            return Container(
              height: widget.height,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(widget.height / 2),
                color: CyberpunkPalette.darkBorder,
              ),
              child: Stack(
                children: [
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(widget.height / 2),
                      color: CyberpunkPalette.darkBorder.withOpacity(0.3),
                    ),
                  ),
                  FractionallySizedBox(
                    widthFactor: _animation.value,
                    alignment: Alignment.centerLeft,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(widget.height / 2),
                        gradient: LinearGradient(
                          colors: [
                            widget.color ?? CyberpunkPalette.neonCyan,
                            (widget.color ?? CyberpunkPalette.neonCyan)
                                .withOpacity(0.7),
                          ],
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: (widget.color ?? CyberpunkPalette.neonCyan)
                                .withOpacity(0.5),
                            blurRadius: 8,
                            spreadRadius: 1,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
