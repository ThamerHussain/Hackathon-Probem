abstract class AuthRepo {
  Future<void> login();
  Future<void> register();
  Future<void> logout([bool force = false]);
  Future<bool> isLoggedIn();
  Future<String?> getValidToken();
  Future<String?> getIdToken();
  Future<String?> refreshToken();
  Future<({String? userId, String? username, String? email})> userPayload();
  Future<({String? ssoUserId, String? accountId})> getUserIdsFromToken();
  Future<void> testTokenPersistenceOnAppStart();
}
