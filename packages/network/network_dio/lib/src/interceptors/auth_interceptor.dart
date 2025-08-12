// -------------------------------------------------------------------
// Author: WANG JUN
// Date: 2025/08/11
// Description: 
// -------------------------------------------------------------------
import 'package:dio/dio.dart';

class AuthInterceptor extends Interceptor {
  final Future<String?> Function() tokenProvider;
  AuthInterceptor(this.tokenProvider);

  @override
  Future<void> onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final token = await tokenProvider();
    if (token != null && token.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    handler.next(options);
  }
}

