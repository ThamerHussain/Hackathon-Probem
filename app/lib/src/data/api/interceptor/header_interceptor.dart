import 'package:hackathon/env/env.dart';
import 'package:hackathon/src/core/utils/log.dart';
import 'package:dio/dio.dart';

class HeaderInterceptors extends Interceptor {
  final Env env;
  final Future<({String appVersion, String osVersion})> getVersion;
  final Future<String> Function() getLanguage;
  HeaderInterceptors({
    required this.env,
    required this.getVersion,
    required this.getLanguage,
  });

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    try {
      options.headers["X-User-Role"] = "Customer";

      final version = await getVersion;

      options.headers["X-Client-Version"] = version.appVersion;
      options.headers["X-Client-Name"] = version.osVersion;
      final language = await getLanguage();
      options.headers["Accept-Language"] = language;
    } catch (e, s) {
      logger.error(" error in header interceptor ", e, s);
    } finally {
      handler.next(options);
    }
  }
}
