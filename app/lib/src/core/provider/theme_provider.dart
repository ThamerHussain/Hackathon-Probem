import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hackathon/src/data/service/local_storage_service.dart';
import 'package:hackathon/src/core/provider/storage.dart';

final themeModeProvider = StateNotifierProvider<ThemeModeNotifier, ThemeMode>((
  ref,
) {
  return ThemeModeNotifier(ref);
});

class ThemeModeNotifier extends StateNotifier<ThemeMode> {
  final Ref _ref;

  ThemeModeNotifier(this._ref) : super(ThemeMode.dark) {
    _loadThemeMode();
  }

  Future<void> _loadThemeMode() async {
    try {
      final sharedPrefs = await _ref.read(sharedPreferenceProvider.future);
      final localStorageService = LocalStorageService(
        sharedPreferences: sharedPrefs,
      );
      final isDarkMode = await localStorageService.getIsDarkMode();
      state = isDarkMode ? ThemeMode.dark : ThemeMode.light;
    } catch (e) {
      state = ThemeMode.dark;
    }
  }

  Future<void> toggleTheme() async {
    final newMode = state == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
    state = newMode;
    await _saveThemeMode(newMode);
  }

  Future<void> setThemeMode(ThemeMode mode) async {
    state = mode;
    await _saveThemeMode(mode);
  }

  Future<void> _saveThemeMode(ThemeMode mode) async {
    try {
      final sharedPrefs = await _ref.read(sharedPreferenceProvider.future);
      final localStorageService = LocalStorageService(
        sharedPreferences: sharedPrefs,
      );
      await localStorageService.setIsDarkMode(mode == ThemeMode.dark);
    } catch (e) {}
  }
}

final isDarkModeProvider = Provider<bool>((ref) {
  final themeMode = ref.watch(themeModeProvider);
  return themeMode == ThemeMode.dark;
});
