part of "base.dart";

sealed class ApiFailure implements BaseFailure {
  ApiFailure();
}

class DioFailure implements ApiFailure {
  final DioException error;

  DioFailure(this.error);

  @override
  translate(Translations localizations) {
    return localizations.unknownError;
  }
}

class ConnectionFailure implements ApiFailure {
  ConnectionFailure();

  @override
  translate(Translations localizations) {
    return localizations.connectionError;
  }
}

class InvalidCredentialFailure implements ApiFailure {
  const InvalidCredentialFailure();

  @override
  translate(Translations localizations) {
    return localizations.invalidCredentials;
  }
}

class TakenEmailFailure implements ApiFailure {
  const TakenEmailFailure();

  @override
  translate(Translations localizations) {
    return localizations.usedEmail;
  }
}

class AuthFailedFailure implements ApiFailure {
  const AuthFailedFailure();

  @override
  translate(Translations localizations) {
    return localizations.failedGoogleAuth;
  }
}

class FailedRefreshTokenFailure implements ApiFailure {
  const FailedRefreshTokenFailure();

  @override
  translate(Translations localizations) {
    return localizations.invalidCredentials;
  }
}

//TODO(init): this must be change based on the app backend and used inside error inspector
class MessagedApiFailure implements ApiFailure {
  final String? englishMessage;
  final String? localizedMessage;

  const MessagedApiFailure(this.englishMessage, this.localizedMessage);

  @override
  translate(Translations localizations) {
    return localizedMessage ?? englishMessage ?? localizations.unknownError;
  }
}
