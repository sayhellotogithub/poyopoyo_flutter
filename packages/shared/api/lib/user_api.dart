// -------------------------------------------------------------------
// Author: WANG JUN
// Date: 2025/08/11
// Description:
// -------------------------------------------------------------------
import 'package:dio/dio.dart';
import 'package:dto/dto.dart';
import 'package:retrofit/retrofit.dart';

part 'user_api.g.dart';

@RestApi()
abstract class UserApi {
  factory UserApi(Dio dio, {String baseUrl}) = _UserApi;

  @GET("/v1/me")
  Future<UserDto> me();

  @POST("/v1/login")
  Future<UserDto> login(@Body() Map<String, dynamic> body);

  @PUT("/v1/users/{id}")
  Future<UserDto> updateUser(
    @Path("id") String id,
    @Body() Map<String, dynamic> body,
  );
}
