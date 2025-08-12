// -------------------------------------------------------------------
// Author: WANG JUN
// Date: 2025/08/12
// Description:
// -------------------------------------------------------------------
import 'package:auth/data/mapper/user_mapper.dart';
import 'package:dto/dto.dart';
import 'package:network_core/core.dart';

import '../../domain/entities/User.dart';
import '../../domain/repository/i_test_repository.dart';

class TestRepositoryImpl implements ITestRepository {
  final INetworkClient _client;

  TestRepositoryImpl(this._client);

  @override
  Future<Result<User, NetFailure>> test() {
    final req = Request(
      method: HttpMethod.get,
      uri: Uri.parse('/v1/me'),
      authenticated: true,
    );
    return safeRequest(_client, req, (res) {
      return UserDto.fromJson(res.asJson()).toEntity();
    });
  }
}
