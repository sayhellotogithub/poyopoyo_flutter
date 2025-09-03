// -------------------------------------------------------------------
// Author: WANG JUN
// Date: 2025/08/20
// Description:
// -------------------------------------------------------------------
import 'package:dio/dio.dart';

import '../presentation/model/error_scenario.dart';

class ScenarioInterceptor extends Interceptor {
  ErrorScenario scenario;

  ScenarioInterceptor(this.scenario);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
// 根据场景构造“虚拟响应或异常”
    if (scenario.kind == ScenarioKind.network) {
      switch (scenario.netKind) {
        case NetKind.timeout:
          handler.reject(DioException(
            requestOptions: options,
            type: DioExceptionType.receiveTimeout,
            error: 'Simulated timeout',
          ));
          return;
        case NetKind.noConnection:
          handler.reject(DioException(
            requestOptions: options,
            type: DioExceptionType.connectionError,
            error: 'Simulated offline',
          ));
          return;
        case NetKind.unauthorized:
          handler.resolve(Response(
            requestOptions: options,
            statusCode: 401,
            data: {'message': 'Unauthorized'},
          ));
          return;
        case NetKind.http503:
          handler.resolve(Response(
            requestOptions: options,
            statusCode: 503,
            data: {'message': 'Service Unavailable'},
          ));
          return;
        case NetKind.httpOther:
          handler.resolve(Response(
            requestOptions: options,
            statusCode: scenario.httpStatus ?? 500,
            data: {'message': 'Other http error'},
          ));
          return;
        default:
          break;
      }
    } else {
// 业务错误：返回 200 + 包裹体 success=false
      handler.resolve(Response(
        requestOptions: options,
        statusCode: 200,
        data: {
          'success': false,
          'code': scenario.bizCode,
          'message': scenario.bizMessage ?? '',
        },
      ));
      return;
    }

// 正常成功（默认）
    handler.resolve(Response(
      requestOptions: options,
      statusCode: 200,
      data: {
        'success': true,
        'data': {'ok': true},
      },
    ));
  }
}
