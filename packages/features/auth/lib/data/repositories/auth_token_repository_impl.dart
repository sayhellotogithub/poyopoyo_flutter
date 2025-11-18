// -------------------------------------------------------------------
// Author: WANG JUN
// Date: 2025/11/18
// Description: 
// -------------------------------------------------------------------

import '../../domain/repository/auth_token_repository.dart';
import '../datasources/auth_token_local_data_source.dart';

class AuthTokenRepositoryImpl implements AuthTokenRepository {
  final AuthTokenLocalDataSource local;

  AuthTokenRepositoryImpl(this.local);

  @override
  Future<void> saveRefreshToken(String token) => local.saveRefreshToken(token);

  @override
  Future<String?> getRefreshToken() => local.loadRefreshToken();

  @override
  Future<void> clearRefreshToken() => local.clearRefreshToken();
}
