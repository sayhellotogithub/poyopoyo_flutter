// -------------------------------------------------------------------
// Author: WANG JUN
// Date: 2025/08/27
// Description:
// -------------------------------------------------------------------

import 'package:business_failure_i18n/business_failure_i18n.dart';

import '../domain/errorcode/auth_codes.dart';
import 'auth_localizations.dart';

void registerAuthBizI18n(IBizFailureRegistry reg) {
  reg.register(AuthCodes.userBlocked, (ctx, f) {
    final s = AuthLocalizations.of(ctx)!;
    return s.auth_user_blocked(10);
  });
  reg.register(AuthCodes.kycRequired, (ctx, f) {
    final s = AuthLocalizations.of(ctx)!;
    return s.auth_kyc_required;
  });
  reg.register(AuthCodes.tokenExpired, (ctx, f) {
    final s = AuthLocalizations.of(ctx)!;
    return s.auth_token_expired;
  });
}
