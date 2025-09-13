

import 'package:hackathon/localization/strings.g.dart';
import 'package:flutter/material.dart';

extension LocalizationExtension on BuildContext {
  Translations get t => TranslationProvider.of(this).translations;
}
