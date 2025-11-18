// -------------------------------------------------------------------
// Author: WANG JUN
// Date: 2025/11/18
// Description: 
// -------------------------------------------------------------------

import '../repository/auth_token_repository.dart';

class ClearRefreshTokenUseCase {
  final AuthTokenRepository repository;
  ClearRefreshTokenUseCase(this.repository);

  Future<void> call() {
    return repository.clearRefreshToken();
  }
}