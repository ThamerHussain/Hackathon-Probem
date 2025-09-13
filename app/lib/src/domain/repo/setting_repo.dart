import 'package:hackathon/localization/strings.g.dart';

abstract class SettingRepo {
  Future<bool> isFirstOpen([bool toggle = true]);
  Future<AppLocale> getAppLanguage();
  Future<void> setAppLanguage(AppLocale language);
  Future<bool> isFamilyProtectionEnabled();
  Future<void> setFamilyProtectionEnabled(bool enabled);
}
