// -------------------------------------------------------------------
// Author: WANG JUN
// Date: 2025/09/01
// Description:
// -------------------------------------------------------------------

import 'package:action_policy/action_policy.dart';

import '../errorcode/error_lab_codes.dart';

void registerErrorLabActionPolicy(ActionPolicyBuilder reg) {
  reg.registerCode(ErrorLabCodes.errorActionRetry, (_) => ErrorAction.retry);
  reg.registerCode(ErrorLabCodes.errorActionReauth, (_) => ErrorAction.reauth);
  reg.registerCode(
      ErrorLabCodes.errorActionShowDialog, (_) => ErrorAction.showDialog);
  reg.registerCode(
      ErrorLabCodes.errorActionShowForm, (_) => ErrorAction.showForm);
  reg.registerCode(
      ErrorLabCodes.errorActionRequire3ds, (_) => ErrorAction.require3DS);
  reg.registerCode(
      ErrorLabCodes.errorActionShowToast, (_) => ErrorAction.showToast);
  reg.registerCode(
      ErrorLabCodes.errorActionNavigateKyc, (_) => ErrorAction.navigateKyc);
}
