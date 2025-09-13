import 'package:flutter/material.dart';

abstract class CyberpunkPalette {
  const CyberpunkPalette._();

  static const neonCyan = Color(0xFF00FFFF);
  static const neonPink = Color(0xFFFF00FF);
  static const neonGreen = Color(0xFF00FF00);
  static const neonYellow = Color(0xFFFFFF00);
  static const neonOrange = Color(0xFFFF6600);
  static const neonPurple = Color(0xFF9900FF);
  static const neonBlue = Color(0xFF0099FF);
  static const neonRed = Color(0xFFFF0033);

  static const darkBackground = Color(0xFF0A0A0A);
  static const darkSurface = Color(0xFF1A1A1A);
  static const darkCard = Color(0xFF2A2A2A);
  static const darkBorder = Color(0xFF3A3A3A);

  static const cyanGlow = Color(0x1A00FFFF);
  static const pinkGlow = Color(0x1AFF00FF);
  static const greenGlow = Color(0x1A00FF00);
  static const redGlow = Color(0x1AFF0033);

  static const textPrimary = Color(0xFFFFFFFF);
  static const textSecondary = Color(0xFFCCCCCC);
  static const textMuted = Color(0xFF888888);
  static const textNeon = Color(0xFF00FFFF);

  static const success = Color(0xFF00FF88);
  static const warning = Color(0xFFFFAA00);
  static const error = Color(0xFFFF3366);
  static const info = Color(0xFF00AAFF);

  static const matrixGreen = Color(0xFF00FF41);
  static const matrixGreenDark = Color(0xFF003D00);
  static const matrixGreenGlow = Color(0x1A00FF41);

  static const holographicBlue = Color(0xFF00BFFF);
  static const holographicPurple = Color(0xFF8A2BE2);
  static const holographicPink = Color(0xFFFF69B4);

  static const glassBackground = Color(0x1AFFFFFF);
  static const glassBorder = Color(0x33FFFFFF);
  static const glassShadow = Color(0x0DFFFFFF);
}

class CyberpunkGradients {
  static const neonCyanGradient = LinearGradient(
    colors: [CyberpunkPalette.neonCyan, CyberpunkPalette.neonBlue],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const neonPinkGradient = LinearGradient(
    colors: [CyberpunkPalette.neonPink, CyberpunkPalette.neonPurple],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const matrixGradient = LinearGradient(
    colors: [CyberpunkPalette.matrixGreen, CyberpunkPalette.neonGreen],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static const holographicGradient = LinearGradient(
    colors: [
      CyberpunkPalette.holographicBlue,
      CyberpunkPalette.holographicPurple,
      CyberpunkPalette.holographicPink,
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const darkGradient = LinearGradient(
    colors: [CyberpunkPalette.darkBackground, CyberpunkPalette.darkSurface],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static const scanGradient = LinearGradient(
    colors: [Colors.transparent, CyberpunkPalette.neonCyan, Colors.transparent],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}

class CyberpunkTextStyles {
  static const TextStyle heading = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.w900,
    color: CyberpunkPalette.textPrimary,
    letterSpacing: 2.0,
    shadows: [Shadow(color: CyberpunkPalette.neonCyan, blurRadius: 10)],
  );

  static const TextStyle subheading = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w700,
    color: CyberpunkPalette.textPrimary,
    letterSpacing: 1.5,
  );

  static const TextStyle body = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: CyberpunkPalette.textSecondary,
    letterSpacing: 0.5,
  );

  static const TextStyle neon = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: CyberpunkPalette.neonCyan,
    letterSpacing: 1.0,
    shadows: [Shadow(color: CyberpunkPalette.cyanGlow, blurRadius: 8)],
  );

  static const TextStyle matrix = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: CyberpunkPalette.matrixGreen,
    letterSpacing: 1.0,
    shadows: [Shadow(color: CyberpunkPalette.matrixGreenGlow, blurRadius: 6)],
  );

  static const TextStyle glitch = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w800,
    color: CyberpunkPalette.neonPink,
    letterSpacing: 2.0,
    shadows: [Shadow(color: CyberpunkPalette.pinkGlow, blurRadius: 12)],
  );
}
