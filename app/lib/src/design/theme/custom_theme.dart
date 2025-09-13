import 'package:hackathon/gen/assets.dart';
import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

import 'app_palette.dart';

part 'custom_theme.tailor.dart';

@TailorMixin(themeGetter: ThemeGetter.onBuildContext)
class CustomTheme extends ThemeExtension<CustomTheme>
    with _$CustomThemeTailorMixin {
  CustomTheme({
    required this.primary,
    required this.secondary,
    required this.tertiary,
    required this.quarterly,
    required this.white,
    required this.darkGrey,
    required this.black,
    required this.white70,
    required this.white50,
    required this.white40,
    required this.white30,
    required this.white20,
    required this.white15,
    required this.white10,
    required this.brand15,
    required this.grey100,
    required this.grey200,
    required this.grey300,
    required this.grey400,
    required this.grey500,
    required this.grey600,
    required this.grey700,
    required this.grey800,
  });

  @override
  final Color primary;
  @override
  final Color secondary;
  @override
  final Color tertiary;
  @override
  final Color quarterly;
  @override
  final Color white;
  @override
  final Color darkGrey;
  @override
  final Color black;
  @override
  final Color white70;
  @override
  final Color white50;
  @override
  final Color white40;
  @override
  final Color white30;
  @override
  final Color white20;
  @override
  final Color white15;
  @override
  final Color white10;
  @override
  final Color brand15;
  @override
  final Color grey100;
  @override
  final Color grey200;
  @override
  final Color grey300;
  @override
  final Color grey400;
  @override
  final Color grey500;
  @override
  final Color grey600;
  @override
  final Color grey700;
  @override
  final Color grey800;
}

final customDarkTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: AppPalette.primary,
    primary: AppPalette.primary,
    brightness: Brightness.dark,
    surface: AppPalette.darkGrey,
    background: AppPalette.darkGrey,
    onSurface: AppPalette.white,
    onBackground: AppPalette.white,
    onPrimary: AppPalette.black,
    secondary: AppPalette.secondary,
    onSecondary: AppPalette.white,
    error: Colors.red,
    onError: AppPalette.white,
  ),
  fontFamily: FontFamily.lamaSans,
  extensions: [customDarkThemeExtension],
  useMaterial3: true,
);

final customDarkThemeExtension = CustomTheme(
  primary: AppPalette.primary,
  secondary: AppPalette.secondary,
  tertiary: AppPalette.tertiary,
  quarterly: AppPalette.quarterly,
  white: AppPalette.white,
  darkGrey: AppPalette.darkGrey,
  black: AppPalette.black,
  white70: AppPalette.white70,
  white50: AppPalette.white50,
  white40: AppPalette.white40,
  white30: AppPalette.white30,
  white20: AppPalette.white20,
  white15: AppPalette.white15,
  white10: AppPalette.white10,
  brand15: AppPalette.brand15,
  grey100: AppPalette.grey100,
  grey200: AppPalette.grey200,
  grey300: AppPalette.grey300,
  grey400: AppPalette.grey400,
  grey500: AppPalette.grey500,
  grey600: AppPalette.grey600,
  grey700: AppPalette.grey700,
  grey800: AppPalette.grey800,
);

final customLightTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: AppPalette.primary,
    primary: AppPalette.primary,
    brightness: Brightness.light,
    surface: AppPalette.white,
    background: AppPalette.white,
    onSurface: AppPalette.black,
    onBackground: AppPalette.black,
    onPrimary: AppPalette.white,
    secondary: AppPalette.secondary,
    onSecondary: AppPalette.white,
    error: Colors.red,
    onError: AppPalette.white,
  ),
  fontFamily: FontFamily.lamaSans,
  extensions: [customLightThemeExtension],
  useMaterial3: true,
);

final customLightThemeExtension = CustomTheme(
  primary: AppPalette.primary,
  secondary: AppPalette.secondary,
  tertiary: AppPalette.tertiary,
  quarterly: AppPalette.quarterly,
  white: AppPalette.white,
  darkGrey: AppPalette.white, // Light background
  black: AppPalette.black,
  white70: AppPalette.black.withOpacity(0.7), // Dark text on light background
  white50: AppPalette.black.withOpacity(0.5),
  white40: AppPalette.black.withOpacity(0.4),
  white30: AppPalette.black.withOpacity(0.3),
  white20: AppPalette.black.withOpacity(0.2),
  white15: AppPalette.black.withOpacity(0.15),
  white10: AppPalette.black.withOpacity(0.1),
  brand15: AppPalette.primary.withOpacity(0.15), // Light brand color
  grey100: AppPalette.grey100, // Light greys for light theme
  grey200: AppPalette.grey200,
  grey300: AppPalette.grey300,
  grey400: AppPalette.grey400,
  grey500: AppPalette.grey500,
  grey600: AppPalette.grey600,
  grey700: AppPalette.grey700,
  grey800: AppPalette.grey800,
);
