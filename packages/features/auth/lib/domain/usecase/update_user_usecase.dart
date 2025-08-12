// -------------------------------------------------------------------
// Author: WANG JUN
// Date: 2025/08/11
// Description:
// -------------------------------------------------------------------
import '../entities/User.dart';
import '../repository/i_user_repository.dart';

class UpdateUserUseCase {
  final IUserRepository _repo;

  UpdateUserUseCase(this._repo);

  Future<User> call({
    required String id,
    String? name,
    String? email,
    String? avatarUrl,
  }) {
    return _repo.updateUser(
      id: id,
      name: name,
      email: email,
      avatarUrl: avatarUrl,
    );
  }
}
