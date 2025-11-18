// -------------------------------------------------------------------
// Author: WANG JUN
// Date: 2025/11/18
// Description: 
// -------------------------------------------------------------------
import '../repository/auth_token_repository.dart';

class GetRefreshTokenUseCase {
  final AuthTokenRepository repository;
  GetRefreshTokenUseCase(this.repository);

  Future<String?> call() {
    return repository.getRefreshToken();
  }
}