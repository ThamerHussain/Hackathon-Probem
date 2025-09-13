import 'package:flutter/material.dart';

abstract class AppPalette {
  const AppPalette._();

  static const primary = Color(0xff03BFC9);
  static const disabledPrimary = Color(0xff05515D);
  static const secondary = Color(0xff049AA5);
  static const tertiary = Color(0xff00747A);
  static const quarterly = Color(0xff05515C);
  static const white = Color(0xffffffff);
  static const darkGrey = Color(0xff070714);
  static const black = Color(0xff000000);
  static const grayscale = Color(0xFF13131D);
  static const white70 = Color.fromRGBO(255, 255, 255, 0.7);
  static const white50 = Color.fromRGBO(255, 255, 255, 0.5);
  static const white40 = Color.fromRGBO(255, 255, 255, 0.4);
  static const white30 = Color.fromRGBO(255, 255, 255, 0.3);
  static const white20 = Color.fromRGBO(255, 255, 255, 0.2);
  static const white15 = Color.fromRGBO(255, 255, 255, 0.15);
  static const white10 = Color.fromRGBO(255, 255, 255, 0.1);
  static const brand15 = Color.fromRGBO(3, 191, 201, 0.15);
  static const grey100 = Color.fromRGBO(181, 181, 184, 1);
  static const grey200 = Color.fromRGBO(131, 131, 137, 1);
  static const grey300 = Color.fromRGBO(106, 106, 114, 1);
  static const grey400 = Color.fromRGBO(81, 81, 91, 1);
  static const grey500 = Color.fromRGBO(57, 57, 67, 1);
  static const grey600 = Color.fromRGBO(44, 44, 55, 1);
  static const grey700 = Color.fromRGBO(32, 32, 44, 1);
  static const grey800 = Color.fromRGBO(11, 11, 15, 1);
}
