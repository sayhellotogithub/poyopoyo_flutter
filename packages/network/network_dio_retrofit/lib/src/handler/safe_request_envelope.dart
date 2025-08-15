// -------------------------------------------------------------------
// Author: WANG JUN
// Date: 2025/08/15
// Description:
// -------------------------------------------------------------------
import 'package:dio/dio.dart';
import 'package:domain/domain.dart';
import 'package:network_core/core.dart';
import 'package:network_dio/network_dio.dart';

import '../model/api_envelope.dart';

Future<AppResult<ApiEnvelope<T>>> safeRequestEnvelope<T>(
  Future<ApiEnvelope<T>> Function() call,
) async {
  try {
    final result = await call();
    if (result.success) {
      return Ok<ApiEnvelope<T>, Failure>(result);
    } else {
      return Err<ApiEnvelope<T>, Failure>(BizFailure(
        code: result.code ?? BizCodes.businessError,
        message: result.message ?? '',
        httpStatus: 0,
        extra: {'raw': result},
      ));
    }
  } on DioException catch (e) {
    return Err<ApiEnvelope<T>, Failure>(NetworkFailure(DioUtil.mapDioError(e)));
  } catch (e) {
    return Err<ApiEnvelope<T>, Failure>(NetworkFailure(NetUnknown(e)));
  }
}
