// -------------------------------------------------------------------
// Author: WANG JUN
// Date: 2025/08/12
// Description:
// -------------------------------------------------------------------
import 'package:auth/data/mapper/user_mapper.dart';
import 'package:data/common/api_decoder.dart';
import 'package:domain/types.dart';
import 'package:dto/dto.dart';
import 'package:network_core/core.dart';

import '../../domain/entities/User.dart';
import '../../domain/repository/i_test_repository_v2.dart';

class TestRepositoryV2Impl implements ITestRepositoryV2 {
  final INetworkClient _client;

  TestRepositoryV2Impl(this._client);

  @override
  Future<AppResult<User>> test() async {
    final req = Request(
      method: HttpMethod.get,
      uri: Uri.parse('/v1/me'),
      authenticated: true,
    );
    final netRes =
        await safeRequest<NetResponseBody>(_client, req, (res) => res);

    return decodeEnvelopeBytes<User>(
      netRes,
      (map) => UserDto.fromJson(map).toEntity(), // 只管把 data 区域转成模型
    );
  }
}
