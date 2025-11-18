// -------------------------------------------------------------------
// Author: WANG JUN
// Date: 2025/11/18
// Description: 
// -------------------------------------------------------------------
import '../repository/auth_token_repository.dart';

class SaveRefreshTokenUseCase {
  final AuthTokenRepository repository;

  SaveRefreshTokenUseCase(this.repository);

  Future<void> call(String token) {
    return repository.saveRefreshToken(token);
  }
}
