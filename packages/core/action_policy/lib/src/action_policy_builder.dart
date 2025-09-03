// -------------------------------------------------------------------
// Author: WANG JUN
// Date: 2025/09/01
// Description: 
// -------------------------------------------------------------------
import 'biz_category.dart';
import 'error_action_types.dart';
import 'failure.dart';

abstract interface class ActionPolicyBuilder {
  void registerCode(String code, ErrorAction Function(BizFailure f) fn);
  void registerCategory(BizCategory cat, ErrorAction action);
}