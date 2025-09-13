import 'package:flutter/material.dart';
import 'package:assets/gen/fonts.gen.dart';
import 'custom_theme.dart';

class AppTheme {
  static ThemeData lightTheme() {
    return customLightTheme.sharedCopyWith();
  }

  static ThemeData darkTheme() {
    return customDarkTheme.sharedCopyWith();
  }
}

extension _ThemeDataHelper on ThemeData {
  ThemeData sharedCopyWith() {
    final customTheme =
        extensions[CustomTheme] as CustomTheme? ?? customDarkThemeExtension;

    return copyWith(
      textTheme: TextTheme(
        displayLarge: TextStyle(
          fontSize: 31,
          fontWeight: FontWeight.w700,
          fontFamily: FontFamily.lamaSans,
        ),
        titleLarge: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.w700,
          fontFamily: FontFamily.lamaSans,
        ),
        titleMedium: TextStyle(
          fontSize: 19,
          fontWeight: FontWeight.w700,
          fontFamily: FontFamily.lamaSans,
        ),
        titleSmall: TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.w700,
          fontFamily: FontFamily.lamaSans,
        ),
        labelLarge: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w700,
          fontFamily: FontFamily.lamaSans,
        ),
        headlineSmall: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          fontFamily: FontFamily.lamaSans,
        ),
        bodyLarge: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          fontFamily: FontFamily.lamaSans,
        ),
        bodyMedium: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          fontFamily: FontFamily.lamaSans,
        ),
        bodySmall: TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w400,
          fontFamily: FontFamily.lamaSans,
        ),
      ),

      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          textStyle: textTheme.labelLarge,
          foregroundColor: customTheme.black,
          backgroundColor: customTheme.primary,
          disabledBackgroundColor: customTheme.grey400,
        ),
      ),
    );
  }
}
