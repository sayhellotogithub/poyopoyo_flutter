// -------------------------------------------------------------------
// Author: WANG JUN
// Date: 2025/08/11
// Description:
// -------------------------------------------------------------------
import 'package:api/user_api.dart';
import 'package:auth/domain/repository/i_auth_repository.dart';
import 'package:di/network_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/api/auth_api.dart';
import '../data/repositories/auth_repository_impl.dart';
import '../data/repositories/test_repository_impl.dart';
import '../data/repositories/test_repository_v2_impl.dart';
import '../data/repositories/user_repository_impl.dart';
import '../domain/repository/i_test_repository.dart';
import '../domain/repository/i_test_repository_v2.dart';
import '../domain/repository/i_user_repository.dart';
import '../domain/usecase/get_me_usecase.dart';
import '../domain/usecase/login_usecase.dart';
import '../domain/usecase/update_user_usecase.dart';

final userApiProvider = Provider<UserApi>((ref) {
  final client = ref.read(dioProvider);
  return UserApi(client);
});
final authApiProvider = Provider<AuthApi>((ref) {
  final client = ref.read(dioProvider);
  return AuthApi(client);
});

final testRepositoryProvider = Provider<ITestRepository>((ref) {
  final client = ref.watch(networkClientProvider);
  return TestRepositoryImpl(client);
});

final testRepositoryV2Provider = Provider<ITestRepositoryV2>((ref) {
  final client = ref.watch(networkClientProvider);
  return TestRepositoryV2Impl(client);
});

final authRepoProvider = Provider<IAuthRepository>((ref) {
  final client = ref.watch(authApiProvider);
  return AuthRepositoryImpl(client);
});

final userRepositoryProvider = Provider<IUserRepository>((ref) {
  final api = ref.read(userApiProvider);
  return UserRepositoryImpl(api);
});

final getMeUseCaseProvider = Provider<GetMeUseCase>((ref) {
  return GetMeUseCase(ref.read(userRepositoryProvider));
});

final loginUseCaseProvider = Provider<LoginUseCase>((ref) {
  return LoginUseCase(ref.read(userRepositoryProvider));
});

final updateUserUseCaseProvider = Provider<UpdateUserUseCase>((ref) {
  return UpdateUserUseCase(ref.read(userRepositoryProvider));
});
