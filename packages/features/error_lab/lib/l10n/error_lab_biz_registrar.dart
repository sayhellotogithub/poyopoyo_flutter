// -------------------------------------------------------------------
// Author: WANG JUN
// Date: 2025/08/27
// Description:
// -------------------------------------------------------------------

import 'package:business_failure_i18n/business_failure_i18n.dart';

import '../src/domain/errorcode/error_lab_codes.dart';
import 'error_lab_localizations.dart';

void registerErrorLabBizI18n(IBizFailureRegistry reg) {
  reg.register(ErrorLabCodes.errorActionRetry, (ctx, f) {
    final s = ErrorLabLocalizations.of(ctx)!;
    return s.error_lab_error_action_retry_test;
  });
  reg.register(ErrorLabCodes.errorActionReauth, (ctx, f) {
    final s = ErrorLabLocalizations.of(ctx)!;
    return s.error_lab_error_action_reauth_test;
  });
  reg.register(ErrorLabCodes.errorActionRequire3ds, (ctx, f) {
    final s = ErrorLabLocalizations.of(ctx)!;
    return s.error_lab_error_action_require_3ds_test;
  });

  reg.register(ErrorLabCodes.errorActionShowDialog, (ctx, f) {
    final s = ErrorLabLocalizations.of(ctx)!;
    return s.error_lab_error_action_show_dialog_test;
  });
  reg.register(ErrorLabCodes.errorActionShowForm, (ctx, f) {
    final s = ErrorLabLocalizations.of(ctx)!;
    return s.error_lab_error_action_show_form_test;
  });
  reg.register(ErrorLabCodes.errorActionShowToast, (ctx, f) {
    final s = ErrorLabLocalizations.of(ctx)!;
    return s.error_lab_error_action_show_toast_test;
  });
  reg.register(ErrorLabCodes.errorActionNavigateKyc, (ctx, f) {
    final s = ErrorLabLocalizations.of(ctx)!;
    return s.error_lab_error_action_navigate_kyc_test;
  });
}
