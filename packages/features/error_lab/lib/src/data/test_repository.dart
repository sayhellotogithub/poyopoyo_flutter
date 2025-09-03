// -------------------------------------------------------------------
// Author: WANG JUN
// Date: 2025/08/20
// Description:
// -------------------------------------------------------------------
import 'package:dio/dio.dart';
import 'package:domain/domain.dart';
import 'package:network_dio_retrofit/network_dio_retrofit.dart';

import '../infra/scenario_interceptor.dart';
import '../presentation/model/error_scenario.dart';

class TestRepository {
  final Dio _dio;

  TestRepository._(this._dio);

  factory TestRepository.withScenario(ErrorScenario scenario) {
    final dio = Dio(BaseOptions(baseUrl: 'https://sandbox.local/'));
    dio.interceptors.add(ScenarioInterceptor(scenario));
    return TestRepository._(dio);
  }

  /// 统一通过 safeRequestResponse 走你的分类逻辑
  Future<AppResult<Map<String, dynamic>>> runScenario() {
    return safeRequestResponse<Map<String, dynamic>>(
      () => _dio.get('/test'),
      mapData: (json) => (json as Map).cast<String, dynamic>(),
    );
  }
}
