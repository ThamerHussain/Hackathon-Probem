import 'package:url_launcher/url_launcher.dart';

extension UrlLauncherExtension on String {
  Future<void> launchInAppBrowser() async {
    final uri = Uri.parse(this);

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
}
