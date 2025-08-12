// -------------------------------------------------------------------
// Author: WANG JUN
// Date: 2025/08/12
// Description:
// -------------------------------------------------------------------
import 'package:auth/data/mapper/user_mapper.dart';
import 'package:auth/domain/repository/i_auth_repository.dart';

import '../../domain/entities/User.dart';
import '../api/auth_api.dart';

class AuthRepositoryImpl extends IAuthRepository {
  final AuthApi _api;

  AuthRepositoryImpl(this._api);

  @override
  Future<User> selfApiInformation() async {
    final dto = await _api.selfApiInformation();
    return dto.toEntity();
  }
}
