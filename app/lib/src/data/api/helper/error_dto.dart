import 'package:hackathon/src/core/utils/log.dart';
import 'package:json_annotation/json_annotation.dart';

part 'error_dto.g.dart';

@JsonSerializable()
class ErrorResponseModel {
  @JsonKey(name: 'EnglishName')
  final String? englishMessage;
  @JsonKey(name: 'LocalizedName')
  final String? localizedMessage;
  ErrorResponseModel({this.englishMessage, this.localizedMessage});

  factory ErrorResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ErrorResponseModelFromJson(json);
  Map<String, dynamic> toJson() => _$ErrorResponseModelToJson(this);

  static ErrorResponseModel? safeFromMap(dynamic json) {
    try {
      if (json case Map v) {
        return ErrorResponseModel.fromJson(v.cast());
      }
      return null;
    } catch (e, s) {
      logger.log("Error", exception: e, stackTrace: s);
      return null;
    }
  }
}
