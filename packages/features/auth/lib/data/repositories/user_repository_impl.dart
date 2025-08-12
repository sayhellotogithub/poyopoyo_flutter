// -------------------------------------------------------------------
// Author: WANG JUN
// Date: 2025/08/11
// Description:
// -------------------------------------------------------------------
import 'package:api/user_api.dart';
import 'package:auth/data/mapper/user_mapper.dart';
import 'package:auth/domain/entities/User.dart';

import '../../domain/repository/i_user_repository.dart';

class UserRepositoryImpl implements IUserRepository {
  final UserApi _api;

  UserRepositoryImpl(this._api);

  @override
  Future<User> getMe() async {
    final dto = await _api.me();
    return dto.toEntity();
  }

  @override
  Future<User> login(
      {required String username, required String password}) async {
    final dto = await _api.login({
      'username': username,
      'password': password,
    });
    return dto.toEntity();
  }

  @override
  Future<User> updateUser(
      {required String id,
      String? name,
      String? email,
      String? avatarUrl}) async {
    final dto = await _api.updateUser(id, {
      if (name != null) 'name': name,
      if (email != null) 'email': email,
      if (avatarUrl != null) 'avatarUrl': avatarUrl,
    });
    return dto.toEntity();
  }
}
