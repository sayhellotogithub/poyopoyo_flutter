// -------------------------------------------------------------------
// Author: WANG JUN
// Date: 2025/08/26
// Description:
// -------------------------------------------------------------------
import 'package:action_policy/action_policy.dart';
import 'package:network_core/core.dart';

import 'net_failure_mapper.dart';
import 'network_error_codes.dart';

extension NetworkFailureX on NetworkFailure {
  NetErrInfo get info => mapNetFailure(cause);

  NetErrCode get code => info.code;

  int? get status => info.httpStatus;

  bool isRetryable({Set<int> retryableStatuses = const {429, 502, 503, 504}}) =>
      mapNetFailure(cause, retryableStatuses: retryableStatuses).code ==
          NetErrCode.httpRetryable ||
      code == NetErrCode.timeout ||
      code == NetErrCode.offline;
}

extension NetErrCodeX on NetErrCode {
  NetworkFailure toFailure({int? httpStatus}) {
    switch (this) {
      case NetErrCode.offline:
        return NetworkFailure(NetNoConnection());
      case NetErrCode.timeout:
        return NetworkFailure(NetTimeout());
      case NetErrCode.cancelled:
        return NetworkFailure(NetCanceled());
      case NetErrCode.tls:
        return NetworkFailure(NetTls());
      case NetErrCode.dns:
        return NetworkFailure(NetDns());
      case NetErrCode.unauthorized:
        return NetworkFailure(NetHttpError(401));
      case NetErrCode.httpRetryable:
        return NetworkFailure(NetHttpError(500));
      case NetErrCode.httpOther:
        return NetworkFailure(NetHttpError(400));
      case NetErrCode.badResponse:
        return NetworkFailure(NetHttpError(400));
      case NetErrCode.tooManyRequests:
        return NetworkFailure(NetHttpError(429));
      case NetErrCode.notFound:
        return NetworkFailure(NetHttpError(404));
      case NetErrCode.forbidden:
        return NetworkFailure(NetHttpError(403));

      case NetErrCode.unknown:
        return NetworkFailure(NetUnknown('Unknown'));
    }
  }
}
