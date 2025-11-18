// -------------------------------------------------------------------
// Author: WANG JUN
// Date: 2025/11/18
// Description:
// -------------------------------------------------------------------
import 'package:auth/data/datasources/auth_token_local_data_source.dart';
import 'package:auth/data/security/token_crypto_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/repositories/auth_token_repository_impl.dart';
import '../../domain/usecase/auth_token_repository.dart';
import '../../domain/usecase/clear_refresh_token_usecase.dart';
import '../../domain/usecase/save_refresh_token_usecase.dart';
import '../viewmodel/auth_view_model.dart';

final tokenCryptoProvider = Provider((ref) => TokenCryptoService());

final localDataSourceProvider =
    Provider((ref) => AuthTokenLocalDataSource(ref.watch(tokenCryptoProvider)));

final tokenRepoProvider = Provider(
    (ref) => AuthTokenRepositoryImpl(ref.watch(localDataSourceProvider)));

final saveUseCaseProvider = Provider(
  (ref) => SaveRefreshTokenUseCase(ref.watch(tokenRepoProvider)),
);

final getUseCaseProvider = Provider(
  (ref) => GetRefreshTokenUseCase(ref.watch(tokenRepoProvider)),
);

final clearUseCaseProvider = Provider(
  (ref) => ClearRefreshTokenUseCase(ref.watch(tokenRepoProvider)),
);

final authViewModelProvider =
StateNotifierProvider<AuthViewModel, AuthState>((ref) {
  return AuthViewModel(
    saveUseCase: ref.watch(saveUseCaseProvider),
    getUseCase: ref.watch(getUseCaseProvider),
    clearUseCase: ref.watch(clearUseCaseProvider),
  );
});