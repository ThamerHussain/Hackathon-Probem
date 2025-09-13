import 'package:hackathon/env/env.dart';
import 'package:hackathon/localization/strings.g.dart';
import 'package:flutter_appauth/flutter_appauth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

class AppAuthService {
  final Env env;
  final Ref ref;
  final FlutterAppAuth _appAuth = const FlutterAppAuth();

  String? _accessToken;
  String? _idToken;

  AppAuthService({required this.env, required this.ref});

  String? get accessToken => _accessToken;
  String? get idToken => _idToken;

  void setIdTokenFromStorage(String? token) {
    _idToken = token;
  }

  String _getCurrentLocale() {
    try {
      return LocaleSettings.currentLocale.languageCode;
    } catch (e) {
      return 'ar';
    }
  }

  Future<AuthorizationTokenResponse> authenticate() async {
    final locale = _getCurrentLocale();

    final result = await _appAuth.authorizeAndExchangeCode(
      AuthorizationTokenRequest(
        env.keyClockClientId,
        env.keyClockRedirectUrl,
        issuer: env.keyClockUrl,
        scopes: ['openid', 'profile', 'email', 'offline_access'],
        allowInsecureConnections: true,
        additionalParameters: {'ui_locales': locale},
      ),
    );

    _accessToken = result.accessToken;
    _idToken = result.idToken;
    return result;
  }

  Future<void> register() async {
    final locale = _getCurrentLocale();
    final registrationUrl = env.registrationUrl;
    final callbackUrl = env.registrationCallbackUrl;
    final modifiedUrl =
        '$registrationUrl?callback=${Uri.encodeComponent(callbackUrl)}&ui_locales=$locale';

    final uri = Uri.parse(modifiedUrl);

    if (await canLaunchUrl(uri)) {
      await launchUrl(
        uri,
        mode: LaunchMode.inAppBrowserView,
        webViewConfiguration: const WebViewConfiguration(
          enableJavaScript: true,
          enableDomStorage: true,
        ),
      );
    } else {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  Future<TokenResponse> refreshToken(String refreshToken) async {
    final result = await _appAuth.token(
      TokenRequest(
        env.keyClockClientId,
        env.keyClockRedirectUrl,
        issuer: env.keyClockUrl,
        scopes: ['openid', 'profile', 'email', 'offline_access', 'roles'],
        refreshToken: refreshToken,
      ),
    );

    if (result.accessToken != null) {
      _accessToken = result.accessToken;
      _idToken = result.idToken;
    }

    return result;
  }

  Future<void> logout() async {
    await _appAuth.endSession(
      EndSessionRequest(
        postLogoutRedirectUrl: idToken != null ? env.keyClockRedirectUrl : null,
        idTokenHint: idToken,
        issuer: env.keyClockUrl,
      ),
    );
    _accessToken = null;
    _idToken = null;
  }
}