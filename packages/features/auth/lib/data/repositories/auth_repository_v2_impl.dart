// -------------------------------------------------------------------
// Author: WANG JUN
// Date: 2025/08/13
// Description:
// -------------------------------------------------------------------
import 'package:auth/data/mapper/user_mapper.dart';
import 'package:auth/domain/entities/User.dart';
import 'package:domain/domain.dart';
import 'package:dto/dto.dart';
import 'package:network_dio_retrofit/network_dio_retrofit.dart';

import '../../domain/repository/i_auth_repository_v2.dart';
import '../api/auth_api_v2.dart';

class AuthRepositoryV2Impl extends IAuthRepositoryV2 {
  final AuthApiV2 _api;

  AuthRepositoryV2Impl(this._api);

  @override
  Future<AppResult<User>> selfApiInformation() async {
    final httpResponse = await _api.selfApiInformation();
    return fromHttpResponse<User>(httpResponse,
        mapData: (map) => UserDto.fromJson(map).toEntity());
  }
}
