import 'dart:convert';
import 'dart:typed_data';
import 'package:dio/dio.dart';
import 'package:hackathon/src/core/utils/log.dart';

class FingerprintApiService {
  final Dio _dio;
  final String baseUrl;

  FingerprintApiService({required Dio dio, required this.baseUrl}) : _dio = dio;

  Future<FingerprintMatchResult> matchFingerprint({
    required Uint8List imageData,
    required String filename,
  }) async {
    try {
      logger.log('Sending fingerprint to matching endpoint: $baseUrl/match');

      await Future.delayed(const Duration(milliseconds: 1));

      final formData = FormData.fromMap({
        'file': MultipartFile.fromBytes(imageData, filename: filename),
      });

      final response = await _dio.post(
        '$baseUrl/match',
        data: formData,
        options: Options(
          headers: {'Content-Type': 'multipart/form-data'},
          sendTimeout: const Duration(seconds: 30),
          receiveTimeout: const Duration(seconds: 30),
        ),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = response.data;
        return FingerprintMatchResult.fromResponse(data);
      } else {
        throw FingerprintApiException(
          'Unexpected response code: ${response.statusCode}',
          response.statusCode,
        );
      }
    } on DioException catch (e) {
      logger.log('Fingerprint API error: ${e.message}');
      throw FingerprintApiException(
        'Network error: ${e.message}',
        e.response?.statusCode,
      );
    } catch (e) {
      logger.log('Fingerprint API unexpected error: $e');
      throw FingerprintApiException('Unexpected error: $e', null);
    }
  }

  Future<bool> testConnection() async {
    try {
      await Future.delayed(const Duration(milliseconds: 1));

      final formData = FormData.fromMap({
        'file': MultipartFile.fromBytes(Uint8List(0), filename: 'test.txt'),
      });

      final response = await _dio.post(
        '$baseUrl/match',
        data: formData,
        options: Options(
          headers: {'Content-Type': 'multipart/form-data'},
          sendTimeout: const Duration(seconds: 10),
          receiveTimeout: const Duration(seconds: 10),
        ),
      );

      return response.statusCode != null &&
          (response.statusCode == 200 || response.statusCode == 201);
    } catch (e) {
      logger.log('Connection test failed: $e');
      return false;
    }
  }
}

class FingerprintMatchResult {
  final bool isMatch;
  final double confidence;
  final String? matchId;
  final String? message;
  final DateTime timestamp;
  final int? time; // API elapsed time in milliseconds

  const FingerprintMatchResult({
    required this.isMatch,
    required this.confidence,
    this.matchId,
    this.message,
    required this.timestamp,
    this.time,
  });

  factory FingerprintMatchResult.fromJson(Map<String, dynamic> json) {
    final confidence = (json['matching'] as num?)?.toDouble() ?? 0.0;
    final time = json['time'] as int?;
    return FingerprintMatchResult(
      isMatch: confidence > 0.5,
      confidence: confidence,
      matchId: json['fingerprintId'] as String?,
      message: null,
      timestamp: DateTime.now(),
      time: time,
    );
  }

  factory FingerprintMatchResult.fromResponse(dynamic response) {
    if (response is String) {
      try {
        final json = jsonDecode(response) as Map<String, dynamic>;
        return FingerprintMatchResult.fromJson(json);
      } catch (e) {
        final confidence = double.tryParse(response) ?? 0.0;
        return FingerprintMatchResult(
          isMatch: confidence > 0.5,
          confidence: confidence,
          matchId: null,
          message: response,
          timestamp: DateTime.now(),
          time: null,
        );
      }
    } else if (response is Map<String, dynamic>) {
      return FingerprintMatchResult.fromJson(response);
    } else if (response is num) {
      final confidence = response.toDouble();
      return FingerprintMatchResult(
        isMatch: confidence > 0.5,
        confidence: confidence,
        matchId: null,
        message: null,
        timestamp: DateTime.now(),
        time: null,
      );
    } else {
      logger.log('Unexpected response type: ${response.runtimeType}');
      return FingerprintMatchResult(
        isMatch: false,
        confidence: 0.0,
        matchId: null,
        message: 'Unexpected response format',
        timestamp: DateTime.now(),
        time: null,
      );
    }
  }

  Map<String, dynamic> toJson() {
    return {'matching': confidence};
  }

  @override
  String toString() {
    return 'FingerprintMatchResult(isMatch: $isMatch, confidence: $confidence, matchId: $matchId, time: $time)';
  }
}

class FingerprintApiException implements Exception {
  final String message;
  final int? statusCode;

  const FingerprintApiException(this.message, this.statusCode);

  @override
  String toString() =>
      'FingerprintApiException: $message (Status: $statusCode)';
}
