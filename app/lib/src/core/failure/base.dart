import 'package:dio/dio.dart';
import 'package:hackathon/localization/strings.g.dart';

part 'api.part.dart';

abstract class BaseFailure {
  BaseFailure();

  String translate(Translations localizations);
}

sealed class LogicFailure implements BaseFailure {
  LogicFailure();

  @override
  translate(Translations localizations);
}

class UnknownFailure implements BaseFailure {
  final Object error;
  UnknownFailure(this.error);

  @override
  translate(Translations localizations) {
    return error.toString();
  }
}
