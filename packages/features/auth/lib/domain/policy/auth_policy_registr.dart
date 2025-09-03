// -------------------------------------------------------------------
// Author: WANG JUN
// Date: 2025/09/01
// Description:
// -------------------------------------------------------------------

import 'package:action_policy/action_policy.dart';

import '../errorcode/auth_codes.dart';

void registerAuthActionPolicy(ActionPolicyBuilder reg) {
  reg.registerCode(AuthCodes.tokenExpired, (_) => ErrorAction.reauth);
  reg.registerCode(AuthCodes.kycRequired, (_) => ErrorAction.showDialog);
  reg.registerCode(AuthCodes.userBlocked, (_) => ErrorAction.reauth);
}
