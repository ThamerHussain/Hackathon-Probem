// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'error_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ErrorResponseModel _$ErrorResponseModelFromJson(Map<String, dynamic> json) =>
    ErrorResponseModel(
      englishMessage: json['EnglishName'] as String?,
      localizedMessage: json['LocalizedName'] as String?,
    );

Map<String, dynamic> _$ErrorResponseModelToJson(ErrorResponseModel instance) =>
    <String, dynamic>{
      'EnglishName': instance.englishMessage,
      'LocalizedName': instance.localizedMessage,
    };
