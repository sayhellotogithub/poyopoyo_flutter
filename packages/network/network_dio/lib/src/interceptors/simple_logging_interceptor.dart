// -------------------------------------------------------------------
// Author: WANG JUN
// Date: 2025/08/11
// Description: 
// -------------------------------------------------------------------
import 'package:dio/dio.dart';

class SimpleLoggingInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // 生产可切换到更轻量日志，或接入性能监控
    // print('[REQ] ${options.method} ${options.uri} ${options.data}');
    handler.next(options);
  }
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // print('[RES] ${response.statusCode} ${response.requestOptions.uri}');
    handler.next(response);
  }
}