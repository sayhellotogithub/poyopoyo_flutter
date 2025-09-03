// -------------------------------------------------------------------
// Author: WANG JUN
// Date: 2025/08/12
// Description:
// -------------------------------------------------------------------

import 'package:network_core/core.dart';

sealed class Failure {
  const Failure();
}

class NetworkFailure extends Failure {
  final NetFailure cause;

  const NetworkFailure(this.cause);

  @override
  String toString() => 'NetworkFailure(cause=$cause)';
}

class BizFailure extends Failure {
  final String code;
  final String message;
  final int? httpStatus;
  final String? tracedId;
  final Map<String, Object?> extra;

  const BizFailure({
    required this.code,
    required this.message,
    this.httpStatus,
    this.tracedId,
    this.extra = const {},
  });
}
