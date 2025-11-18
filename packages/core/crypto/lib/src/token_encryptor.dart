// -------------------------------------------------------------------
// Author: WANG JUN
// Date: 2025/11/18
// Description: 
// -------------------------------------------------------------------
abstract class TokenEncryptor{
  Future<void> saveEncryptedRefreshToken(String token);
  Future<String?> loadDecryptedRefreshToken();
  Future<void> clearRefreshToken();
}