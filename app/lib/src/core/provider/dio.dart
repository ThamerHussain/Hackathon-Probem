import 'dart:io';
import 'package:hackathon/src/core/utils/log.dart';
import 'package:dio/io.dart';
import 'package:flutter/foundation.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';
import 'package:dio/dio.dart';
import 'package:riverpod/riverpod.dart';

final dioClient = Provider.family((ref, String baseUrl) {
  final dio = Dio(
    BaseOptions(baseUrl: baseUrl, connectTimeout: const Duration(seconds: 10),
      contentType: Headers.jsonContentType),
  );

  (dio.httpClientAdapter as IOHttpClientAdapter).createHttpClient = () {
    final client = HttpClient();
    client.badCertificateCallback = (cert, host, port) => true;
    return client;
  };

  dio.interceptors.add(
    TalkerDioLogger(
      talker: logger,
      settings: TalkerDioLoggerSettings(
        printErrorData: true,
        printRequestHeaders: !kReleaseMode,
        printErrorHeaders: !kReleaseMode,
        printRequestData: !kReleaseMode,
        printResponseData: false,
        printErrorMessage: true,
      ),
    ),
  );

  return dio;
});
