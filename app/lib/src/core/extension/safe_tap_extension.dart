import 'package:flutter/material.dart';

extension SafeTapExtension on VoidCallback {
  static final Map<String, DateTime> _lastTapTimes = {};
  VoidCallback withSafeTap({String? key, int delayMs = 1000}) {
    final uniqueKey = key ?? identityHashCode(this).toString();
    return () {
      final now = DateTime.now();
      final lastTap = _lastTapTimes[uniqueKey];
      if (lastTap != null && now.difference(lastTap).inMilliseconds < delayMs) {
        debugPrint('Tap ignored for: $uniqueKey');
        return;
      }
      _lastTapTimes[uniqueKey] = now;
      debugPrint('Processing: $uniqueKey');
      try {
        this();
      } catch (e) {
        debugPrint('Error in $uniqueKey: $e');
      }
      if (_lastTapTimes.length > 100) {
        _cleanupOldEntries();
      }
    };
  }

  static void _cleanupOldEntries() {
    final now = DateTime.now();
    final threshold = Duration(minutes: 1);
    _lastTapTimes.removeWhere((_, time) {
      return now.difference(time) > threshold;
    });
    debugPrint('Cleaned old tap entries. Remaining: ${_lastTapTimes.length}');
  }
}
