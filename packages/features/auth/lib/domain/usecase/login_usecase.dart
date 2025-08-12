// -------------------------------------------------------------------
// Author: WANG JUN
// Date: 2025/08/11
// Description:
// -------------------------------------------------------------------
import 'package:auth/domain/entities/User.dart';
import 'package:auth/domain/repository/i_user_repository.dart';

class LoginUseCase {
  final IUserRepository _repo;

  LoginUseCase(this._repo);

  Future<User> call({required String username, required String password}) =>
      _repo.login(username: username, password: password);
}
