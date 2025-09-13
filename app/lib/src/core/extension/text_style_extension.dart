import 'package:flutter/material.dart';

extension TextStyleExtensions on TextStyle? {
  TextStyle? get bold => this?.copyWith(fontWeight: FontWeight.bold);
  TextStyle? get w900 => this?.copyWith(fontWeight: FontWeight.w900);

  TextStyle? get w800 => this?.copyWith(fontWeight: FontWeight.w800);
  TextStyle? get w700 => this?.copyWith(fontWeight: FontWeight.w700);
  TextStyle? get w600 => this?.copyWith(fontWeight: FontWeight.w600);

  TextStyle? get w500 => this?.copyWith(fontWeight: FontWeight.w500);
  TextStyle? get w400 => this?.copyWith(fontWeight: FontWeight.w400);
  TextStyle? get w300 => this?.copyWith(fontWeight: FontWeight.w300);
  TextStyle? get w200 => this?.copyWith(fontWeight: FontWeight.w200);
  TextStyle? weight(FontWeight? fontWeight) =>
      this?.copyWith(fontWeight: fontWeight);
  TextStyle? size(double? fontSize) => this?.copyWith(fontSize: fontSize);
  TextStyle? height(double? fontHeight) => this?.copyWith(height: fontHeight);
  TextStyle? fontColor(Color? color) => this?.copyWith(color: color);
}
