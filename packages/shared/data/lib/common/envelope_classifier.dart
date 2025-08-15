// -------------------------------------------------------------------
// Author: WANG JUN
// Date: 2025/08/12
// Description:
// -------------------------------------------------------------------
import 'package:domain/domain.dart';
import 'package:network_core/core.dart';

AppResult<T> classifyEnvelope<T>(
  int status,
  dynamic body, {
  required T Function(dynamic json) mapData,
}) {
  // 2xx
  if (status >= 200 && status < 300) {
    if (body is Map && body['success'] == true) {
      try {
        return Ok<T, Failure>(mapData(body['data']));
      } catch (e) {
        return Err<T, Failure>(BizFailure(
          code: BizCodes.businessError,
          message: '$e',
          httpStatus: status,
          extra: {'raw': body},
        ));
      }
    }
    final code = (body is Map && body['code'] is String)
        ? body['code'] as String
        : BizCodes.businessError;
    final msg = (body is Map && body['message'] is String)
        ? body['message'] as String
        : '';
    return Err<T, Failure>(BizFailure(
        code: code, message: msg, httpStatus: status, extra: {'raw': body}));
  }

  // 非 2xx
  if (status == 401)
    return Err<T, Failure>(NetworkFailure(const NetUnauthorized()));
  if (body is Map && (body['code'] != null || body['message'] != null)) {
    final code = (body['code'] ?? BizCodes.businessError).toString();
    final msg = (body['message'] ?? '').toString();
    return Err<T, Failure>(BizFailure(
        code: code, message: msg, httpStatus: status, extra: {'raw': body}));
  }
  return Err<T, Failure>(NetworkFailure(NetHttpError(status)));
}
