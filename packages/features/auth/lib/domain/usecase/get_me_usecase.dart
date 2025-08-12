// -------------------------------------------------------------------
// Author: WANG JUN
// Date: 2025/08/11
// Description: 
// -------------------------------------------------------------------

import 'package:auth/domain/entities/User.dart';
import 'package:auth/domain/repository/i_user_repository.dart';

class GetMeUseCase {
  final IUserRepository _repo;
  GetMeUseCase(this._repo);

  Future<User> call() => _repo.getMe();
}
