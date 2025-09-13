import 'dart:typed_data';
import 'package:dio/dio.dart';
import 'package:hackathon/src/core/utils/log.dart';
import 'package:hackathon/src/domain/entities/user.dart';

class UserApiService {
  final Dio _dio;
  final String baseUrl;

  UserApiService({required Dio dio, required this.baseUrl}) : _dio = dio;

  Future<User?> getUserByFingerprintId(String fingerPrintId) async {
    try {
      logger.log('Fetching user by fingerprint ID: $fingerPrintId');

      final response = await _dio.get(
        '$baseUrl/users',
        queryParameters: {
          'name': '',
          'role': '',
          'id': '',
          'fingerPrintId': fingerPrintId,
        },
        options: Options(
          sendTimeout: const Duration(seconds: 30),
          receiveTimeout: const Duration(seconds: 30),
        ),
      );

      if (response.statusCode == 200) {
        final data = response.data;
        if (data is List && data.isNotEmpty) {
          return User.fromJson(data.first);
        } else if (data is Map<String, dynamic>) {
          return User.fromJson(data);
        }
        return null;
      } else {
        throw UserApiException(
          'Unexpected response code: ${response.statusCode}',
          response.statusCode,
        );
      }
    } on DioException catch (e) {
      logger.log('User API error: ${e.message}');
      throw UserApiException(
        'Network error: ${e.message}',
        e.response?.statusCode,
      );
    } catch (e) {
      logger.log('User API unexpected error: $e');
      throw UserApiException('Unexpected error: $e', null);
    }
  }

  Future<User> registerUser({
    required String name,
    required String password,
    required String fingerPrintId,
    required String role,
    Uint8List? imageData,
    String? imageFilename,
  }) async {
    try {
      logger.log('Registering new user: $name');

      final formData = FormData.fromMap({
        'name': name,
        'password': password,
        'fingerPrintId': fingerPrintId,
        'role': role,
        if (imageData != null && imageFilename != null)
          'image': MultipartFile.fromBytes(imageData, filename: imageFilename),
      });

      final response = await _dio.post(
        '$baseUrl/user',
        data: formData,
        options: Options(
          headers: {'Content-Type': 'multipart/form-data'},
          sendTimeout: const Duration(seconds: 30),
          receiveTimeout: const Duration(seconds: 30),
        ),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = response.data;
        return User.fromJson(data);
      } else {
        throw UserApiException(
          'Unexpected response code: ${response.statusCode}',
          response.statusCode,
        );
      }
    } on DioException catch (e) {
      logger.log('User registration error: ${e.message}');
      throw UserApiException(
        'Network error: ${e.message}',
        e.response?.statusCode,
      );
    } catch (e) {
      logger.log('User registration unexpected error: $e');
      throw UserApiException('Unexpected error: $e', null);
    }
  }
}

class UserApiException implements Exception {
  final String message;
  final int? statusCode;

  const UserApiException(this.message, this.statusCode);

  @override
  String toString() => 'UserApiException: $message';
}
