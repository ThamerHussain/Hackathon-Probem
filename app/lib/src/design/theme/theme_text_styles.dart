import 'package:flutter/material.dart';
import 'package:hackathon/src/design/theme/custom_theme.dart';
import 'package:hackathon/src/design/theme/cyberpunk_palette.dart';

class ThemeTextStyles {
  static TextStyle heading(BuildContext context) {
    final theme = Theme.of(context);
    final customTheme = theme.extension<CustomTheme>()!;
    final isDark = theme.brightness == Brightness.dark;

    return TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.w900,
      color: isDark ? customTheme.white : customTheme.black,
      letterSpacing: 2.0,
      shadows: isDark
          ? [Shadow(color: CyberpunkPalette.neonCyan, blurRadius: 10)]
          : null,
    );
  }

  static TextStyle subheading(BuildContext context) {
    final theme = Theme.of(context);
    final customTheme = theme.extension<CustomTheme>()!;
    final isDark = theme.brightness == Brightness.dark;

    return TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w700,
      color: isDark ? customTheme.white : customTheme.black,
      letterSpacing: 1.5,
    );
  }

  static TextStyle body(BuildContext context) {
    final theme = Theme.of(context);
    final customTheme = theme.extension<CustomTheme>()!;
    final isDark = theme.brightness == Brightness.dark;

    return TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: isDark ? customTheme.white70 : customTheme.black.withOpacity(0.7),
      letterSpacing: 0.5,
    );
  }

  static TextStyle neon(BuildContext context) {
    final theme = Theme.of(context);
    final customTheme = theme.extension<CustomTheme>()!;
    final isDark = theme.brightness == Brightness.dark;

    return TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: customTheme.primary,
      letterSpacing: 1.0,
      shadows: isDark
          ? [Shadow(color: customTheme.primary.withOpacity(0.3), blurRadius: 8)]
          : null,
    );
  }

  static TextStyle matrix(BuildContext context) {
    final theme = Theme.of(context);
    final customTheme = theme.extension<CustomTheme>()!;
    final isDark = theme.brightness == Brightness.dark;

    return TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: isDark ? CyberpunkPalette.matrixGreen : customTheme.primary,
      letterSpacing: 1.0,
      shadows: isDark
          ? [Shadow(color: CyberpunkPalette.matrixGreenGlow, blurRadius: 6)]
          : null,
    );
  }

  static TextStyle glitch(BuildContext context) {
    final theme = Theme.of(context);
    final customTheme = theme.extension<CustomTheme>()!;
    final isDark = theme.brightness == Brightness.dark;

    return TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w800,
      color: isDark ? CyberpunkPalette.neonPink : customTheme.secondary,
      letterSpacing: 2.0,
      shadows: isDark
          ? [Shadow(color: CyberpunkPalette.pinkGlow, blurRadius: 12)]
          : null,
    );
  }
}
