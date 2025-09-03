// -------------------------------------------------------------------
// Author: WANG JUN
// Date: 2025/08/25
// Description:
// -------------------------------------------------------------------
import 'package:action_policy/action_policy.dart';
import 'package:flutter/widgets.dart';

typedef BizFormatter = String Function(
    BuildContext context, BizFailure failure);

abstract class IBizFailureRegistry {
  void register(String code, BizFormatter formatter) {}
}

class BizFailureRegistry implements IBizFailureRegistry {
  final bool allowOverride;

  BizFailureRegistry({this.allowOverride = false});

  final Map<String, BizFormatter> _formatters = {};

  @override
  void register(String code, BizFormatter formatter) {
    if (!allowOverride) {
      assert(!_formatters.containsKey(code), 'BizCode duplicated: $code');
    }
    if (allowOverride) _formatters[code] = formatter;
  }

  String? tryFormat(BuildContext context, BizFailure f) {
    final fmt = _formatters[f.code];
    return fmt?.call(context, f);
  }
}
