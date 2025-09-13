import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:hackathon/localization/strings.g.dart';

const initialPage = 1;

extension ListExtensions<T> on List<T>? {
  T next(T current) => this![(this!.indexOf(current) + 1) % this!.length];
  T back(T current) => this![(this!.indexOf(current) - 1) % this!.length];
}

extension MapExtensions on Map<String, dynamic> {
  Map<String, dynamic> removeNull() {
    return this..removeWhere((key, value) => value == null);
  }

  Map<String, dynamic> removeEmpty() {
    return this..removeWhere((key, value) => value.toString().trim().isEmpty);
  }
}

extension NullableStringExtensions on String? {
  bool get isNullOrEmpty => this == null || this!.isEmpty;
  String? get convertEmptyToNull {
    if (this == null) return null;
    return this!.trim().isEmpty ? null : this;
  }
}

extension DateTimex on DateTime {
  /// Formats the date in the format "d MMMM yyyy" based on the locale of the context.
  ///
  /// But the numbers will be always in English.
  String formattedDate(BuildContext context) {
    final locale = Localizations.localeOf(context).languageCode;

    final dayFormat = DateFormat("d", "en");
    final monthFormat = DateFormat("MMMM", locale);
    final yearFormat = DateFormat("yyyy", "en");

    return "${dayFormat.format(this)} ${monthFormat.format(this)} ${yearFormat.format(this)}";
  }

  String formattedDate2(BuildContext context) {
    return DateFormat.yMd('en').format(this);
  }

  String formattedTime(BuildContext context) {
    // final locale = Localizations.localeOf(context).languageCode;

    final timeFormat = DateFormat("h:mm a", 'en');

    return timeFormat.format(this);
  }
}

extension Transformer on String {
  String get capitalizeFirst =>
      length > 1 ? '${this[0].toUpperCase()}${substring(1)}' : '';
}
