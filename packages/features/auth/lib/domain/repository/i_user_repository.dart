// -------------------------------------------------------------------
// Author: WANG JUN
// Date: 2025/08/11
// Description:
// -------------------------------------------------------------------

import 'package:auth/domain/entities/User.dart';

abstract class IUserRepository {
  Future<User> getMe();

  Future<User> login({required String username, required String password});

  Future<User> updateUser({
    required String id,
    String? name,
    String? email,
    String? avatarUrl,
  });
}
