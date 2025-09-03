// -------------------------------------------------------------------
// Author: WANG JUN
// Date: 2025/08/29
// Description: Action strategy: for decideAction query
// -------------------------------------------------------------------


import 'biz_category.dart';
import 'error_action_types.dart';
import 'failure.dart';

abstract interface class ActionPolicy{
  //Code-level strategy (high priority)
  ErrorAction? forCode(String code,BizFailure failure);
  //Category-level strategy (secondary)
  ErrorAction? forCategory(BizCategory category);


}