import 'package:flutter/material.dart';
import 'package:hackathon/src/design/theme/theme.dart';

extension GradientExtensions on BuildContext {
  LinearGradient get primaryGradient => LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    stops: const [0.0, 0.3, 0.7, 1.0],
    colors: [
      customTheme.primary.withValues(alpha: 0.2),
      customTheme.primary.withValues(alpha: 0.15),
      customTheme.primary.withValues(alpha: 0.1),
      customTheme.primary.withValues(alpha: 0.05),
    ],
  );

  LinearGradient get neutralGradient => LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      customTheme.white10,
      customTheme.white10,
      customTheme.white10,
      customTheme.white10,
    ],
  );

  LinearGradient get dialogGradient => LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      customTheme.grey800.withValues(alpha: 0.98),
      customTheme.darkGrey.withValues(alpha: 0.98),
    ],
  );

  Color get primaryBorderColor => customTheme.primary.withValues(alpha: 0.3);

  Color get neutralBorderColor => customTheme.white15;
}
