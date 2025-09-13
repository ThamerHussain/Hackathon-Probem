import 'package:hackathon/localization/strings.g.dart';
import 'package:hackathon/src/core/failure/base.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

String errorToReadableString(Object error, BuildContext context) {
  switch (error) {
    case DioException(error: BaseFailure e):
      return e.translate(context.t);
    case DioException e:
      return UnknownFailure(e).translate(context.t);
    case BaseFailure e:
      return e.translate(context.t);
    case String e:
      return e;
    case Exception e:
      return e.toString();
    default:
      return UnknownFailure(error).translate(context.t);
  }
}
