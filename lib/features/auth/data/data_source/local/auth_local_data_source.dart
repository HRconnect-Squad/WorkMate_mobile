abstract class AuthLocalDataSource {
  Future<String?> getToken();
  Future<void> saveToken(String token);
  Future<void> clearToken();
  Future<bool> hasToken();
  Future<void> saveIdentifier(String email);
  Future<String?> getIdentifier();
  Future<void> clearIdentifier();
}