// -------------------------------------------------------------------
// Author: WANG JUN
// Date: 2025/08/26
// Description:
// -------------------------------------------------------------------
import 'package:action_policy/action_policy.dart';

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
