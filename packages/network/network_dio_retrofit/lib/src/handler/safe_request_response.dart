// -------------------------------------------------------------------
// Author: WANG JUN
// Date: 2025/08/15
// Description: 
// -------------------------------------------------------------------
import 'package:action_policy/action_policy.dart';
import 'package:data/common/envelope_classifier.dart';
import 'package:dio/dio.dart';
import 'package:domain/domain.dart';
import 'package:network_core/core.dart';
import 'package:network_dio/network_dio.dart';

Future<AppResult<T>> safeRequestResponse<T>(
    Future<Response<dynamic>> Function() call, {
      required T Function(dynamic json) mapData,
    }) async {
  try {
    final resp = await call();
    final status = resp.statusCode ?? -1;
    final body = resp.data;
    return classifyEnvelopeSmart<T>(status, body, mapData: mapData);
  } on DioException catch (e) {
    return Err<T, Failure>(NetworkFailure(DioUtil.mapDioError(e)));
  } catch (e) {
    return Err<T, Failure>(NetworkFailure(NetUnknown(e)));
  }
}