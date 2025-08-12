// -------------------------------------------------------------------
// Author: WANG JUN
// Date: 2025/08/11
// Description:
// -------------------------------------------------------------------
import 'package:dio/dio.dart';
import 'package:dto/dto.dart';
import 'package:retrofit/retrofit.dart';

part 'auth_api.g.dart';

@RestApi()
abstract class AuthApi {
  factory AuthApi(Dio dio, {String baseUrl}) = _AuthApi;

  @GET("/v1/auth_self_api_information")
  Future<UserDto> selfApiInformation();
}
