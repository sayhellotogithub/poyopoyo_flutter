// -------------------------------------------------------------------
// Author: WANG JUN
// Date: 2025/08/12
// Description:
// -------------------------------------------------------------------
import 'package:domain/failure.dart';
import 'package:domain/types.dart';
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
          code: 'MALFORMED_DATA',
          message: '数据结构不符合预期: $e',
          httpStatus: status,
          extra: {'raw': body},
        ));
      }
    }
    final code = (body is Map && body['code'] is String)
        ? body['code'] as String
        : 'BUSINESS_ERROR';
    final msg = (body is Map && body['message'] is String)
        ? body['message'] as String
        : '业务处理失败';
    return Err<T, Failure>(BizFailure(
        code: code, message: msg, httpStatus: status, extra: {'raw': body}));
  }

  // 非 2xx
  if (status == 401)
    return Err<T, Failure>(NetworkFailure(const NetUnauthorized()));
  if (body is Map && (body['code'] != null || body['message'] != null)) {
    final code = (body['code'] ?? 'BUSINESS_ERROR').toString();
    final msg = (body['message'] ?? '业务处理失败').toString();
    return Err<T, Failure>(BizFailure(
        code: code, message: msg, httpStatus: status, extra: {'raw': body}));
  }
  return Err<T, Failure>(NetworkFailure(NetHttpError(status)));
}
