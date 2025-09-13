import 'package:hackathon/src/core/utils/log.dart';
import 'package:dio/dio.dart';
import '../helper/option_extension.dart';

class AuthInterceptors extends Interceptor {
  final Future<String?> Function() getToken;
  final Future<void> Function() forceLogout;
  final Future<String?> Function()? refreshToken;
  final Dio dio;

  AuthInterceptors({
    required this.getToken,
    required this.forceLogout,
    this.refreshToken,
    required this.dio,
  });

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    try {
      if (options.headers['Authorization'] == null && !options.isDisableToken) {
        final token = await getToken();
        if (token != null) {
          options.headers['Authorization'] = 'Bearer $token';
        }
      }
      handler.next(options);
    } catch (e) {
      handler.next(options);
    }
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    final response = err.response;
    if (response == null) return handler.next(err);

    if (response.statusCode == 401) {
      await forceLogout();
      return handler.next(err);
    }

    // Handle 403 - Forbidden
    if (response.statusCode == 403 && refreshToken != null) {
      if (response.requestOptions.extra['isRetry'] == true) {
        return handler.next(err);
      }

      try {
        final newToken = await refreshToken!();

        if (newToken != null) {
          final opts = Options(
            method: response.requestOptions.method,
            headers: response.requestOptions.headers,
          );
          opts.headers?['Authorization'] = 'Bearer $newToken';
          opts.extra = response.requestOptions.extra;
          opts.extra?['isRetry'] = true;

          final retryResponse = await dio.request(
            response.requestOptions.path,
            data: response.requestOptions.data,
            queryParameters: response.requestOptions.queryParameters,
            options: opts,
          );

          return handler.resolve(retryResponse);
        } else {
          return handler.next(err);
        }
      } catch (e) {
        logger.error('Error during token refresh: $e');
        return handler.next(err);
      }
    }

    if (!response.requestOptions.isRefreshToken) return handler.next(err);
    final string = response.toString();
    if (string.contains('Token is not active') ||
        string.contains('Invalid refresh token')) {
      await forceLogout();
    }

    handler.next(err);
  }
}
