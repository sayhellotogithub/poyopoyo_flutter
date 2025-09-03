// -------------------------------------------------------------------
// Author: WANG JUN
// Date: 2025/08/29
// -------------------------------------------------------------------

import 'action_policy.dart';
import 'action_policy_builder.dart';
import 'biz_category.dart';
import 'error_action_types.dart';
import 'failure.dart';

final class ActionPolicyRegistry implements ActionPolicy, ActionPolicyBuilder {
  final bool _allowOverride;
  final Map<String, ErrorAction Function(BizFailure failure)> _code = {};
  final Map<BizCategory, ErrorAction> _category = {};

  ActionPolicyRegistry({allowOverride = true})
      : this._allowOverride = allowOverride;

  @override
  void registerCode(String code, ErrorAction Function(BizFailure) action) {
    if (_allowOverride) {
      _code[code] = action;
    } else {
      assert(!_code.containsKey(code), 'Code $code already registered');
    }
  }

  @override
  void registerCategory(BizCategory category, ErrorAction action) {
    if (_allowOverride) {
      _category[category] = action;
    } else {
      assert(!_category.containsKey(category),
          'Category $category already registered');
    }
  }

  @override
  ErrorAction? forCategory(BizCategory category) => _category[category];

  @override
  ErrorAction? forCode(String code, BizFailure failure) =>
      _code[code]?.call(failure);
}
