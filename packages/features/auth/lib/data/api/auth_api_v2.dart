// -------------------------------------------------------------------
// Author: WANG JUN
// Date: 2025/08/11
// Description:
// -------------------------------------------------------------------
import 'package:dio/dio.dart';
import 'package:dto/dto.dart';
import 'package:network_dio_retrofit/network_dio_retrofit.dart';
import 'package:retrofit/retrofit.dart';


part 'auth_api_v2.g.dart';

@RestApi()
abstract class AuthApiV2 {
  factory AuthApiV2(Dio dio, {String baseUrl}) = _AuthApiV2;

  @GET("/v1/auth_self_api_information")
  Future<HttpResponse<ApiEnvelope<UserDto>>> selfApiInformation();
}
