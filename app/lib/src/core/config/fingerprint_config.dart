import 'package:shared_preferences/shared_preferences.dart';

class FingerprintConfig {
  static const String defaultApiEndpoint = 'http://10.36.255.90:3000';

  static const String _apiEndpointKey = 'fingerprint_api_endpoint';

  static const Duration apiTimeout = Duration(seconds: 30);

  static const String imageFormat = 'png';

  static const int maxImageSize = 2 * 1024 * 1024;

  static Future<String> getApiEndpoint() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      return prefs.getString(_apiEndpointKey) ?? defaultApiEndpoint;
    } catch (e) {
      return defaultApiEndpoint;
    }
  }

  static Future<void> setApiEndpoint(String endpoint) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(_apiEndpointKey, endpoint);
    } catch (e) {}
  }

  static Future<void> resetToDefault() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove(_apiEndpointKey);
    } catch (e) {}
  }
}
