import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

const _isFirstTime = "is_first_time";
const _languageCode = "language_code";
const _familyProtectionEnabled = "family_protection_enabled";
const _isDarkMode = "is_dark_mode";

class LocalStorageService {
  final SharedPreferences sharedPreferences;

  LocalStorageService({required this.sharedPreferences});

  Future<void> clear() {
    return sharedPreferences.clear();
  }

  Future<void> setLanguageCode(String language) {
    return sharedPreferences.setString(_languageCode, language);
  }

  Future<String?> getLanguageCode() async {
    final value = sharedPreferences.getString(_languageCode);
    return value;
  }

  Future<void> setIsFirstTime(bool isFirstTime) {
    return sharedPreferences.setBool(_isFirstTime, isFirstTime);
  }

  Future<bool> getIsFirstTime() async {
    final value = sharedPreferences.getBool(_isFirstTime);
    return value ?? true;
  }

  Future<void> setJson(String key, Map<String, dynamic> value) async {
    await sharedPreferences.setString(key, jsonEncode(value));
  }

  Map<String, dynamic>? getJson(String key) {
    final jsonString = sharedPreferences.getString(key);
    if (jsonString == null || jsonString.isEmpty) return null;
    return Map<String, dynamic>.from(json.decode(jsonString));
  }

  Future<void> removeKey(String key) async {
    await sharedPreferences.remove(key);
  }

  Future<void> setFamilyProtectionEnabled(bool enabled) async {
    await sharedPreferences.setBool(_familyProtectionEnabled, enabled);
  }

  Future<bool> getFamilyProtectionEnabled() async {
    final value = sharedPreferences.getBool(_familyProtectionEnabled);
    return value ?? false;
  }

  Future<void> setIsDarkMode(bool isDarkMode) async {
    await sharedPreferences.setBool(_isDarkMode, isDarkMode);
  }

  Future<bool> getIsDarkMode() async {
    final value = sharedPreferences.getBool(_isDarkMode);
    return value ?? true; // Default to dark mode
  }
}
