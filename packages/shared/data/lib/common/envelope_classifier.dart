// -------------------------------------------------------------------
// Author: WANG JUN
// Date: 2025/08/12
// Description:
// -------------------------------------------------------------------
import 'package:action_policy/action_policy.dart';
import 'package:domain/domain.dart';
import 'package:network_core/core.dart';

AppResult<T> classifyEnvelopeSmart<T>(
  int status,
  dynamic body, {
  required T Function(dynamic json) mapData,
}) {
  // 2xx
  if (status >= 200 && status < 300) {
    if (body is Map && body['success'] == true) {
      return Ok<T, Failure>(_coerce<T>(body['data'], mapData: mapData));
    }
    return Ok<T, Failure>(_coerce<T>(body, mapData: mapData));
  }
  // 非 2xx
  if (status == 401)
    return Err<T, Failure>(NetworkFailure(const NetUnauthorized()));

  if (body is Map && body['code'] is String? && body['message'] is String?) {
    return Err<T, Failure>(BizFailure(
      code: body['code'] as String? ?? CommonCodes.businessError,
      message: body['message'] as String? ?? '',
      httpStatus: status,
      extra: {'raw': body},
    ));
  }
  return Err<T, Failure>(NetworkFailure(NetHttpError(status)));
}

T _coerce<T>(dynamic body, {T Function(dynamic)? mapData}) {
  if (mapData != null) return mapData(body);
  throw StateError(
      'Cannot coerce body to $T. Provide mapData or ensure converter returns $T.');
}
