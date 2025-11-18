// -------------------------------------------------------------------
// Author: WANG JUN
// Date: 2025/11/18
// Description: 
// -------------------------------------------------------------------
abstract class AuthTokenRepository {
  Future<void> saveRefreshToken(String token);
  Future<String?> getRefreshToken();
  Future<void> clearRefreshToken();
}