// -------------------------------------------------------------------
// Author: WANG JUN
// Date: 2025/11/18
// Description: 
// -------------------------------------------------------------------
import '../security/token_crypto_service.dart';

class AuthTokenLocalDataSource {
  final TokenCryptoService encryptor;

  AuthTokenLocalDataSource(this.encryptor);

  Future<void> saveRefreshToken(String token) =>
      encryptor.saveEncryptedRefreshToken(token);

  Future<String?> loadRefreshToken() =>
      encryptor.loadDecryptedRefreshToken();

  Future<void> clearRefreshToken() =>
      encryptor.clearRefreshToken();
}