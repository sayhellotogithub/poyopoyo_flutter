// -------------------------------------------------------------------
// Author: WANG JUN
// Date: 2025/08/27
// Description:
// -------------------------------------------------------------------
import 'package:domain/domain.dart'; // BizFailure, BizCode, CommonCodes

import '../business_failure_i18n.dart';

void registerCommonBizI18n(IBizFailureRegistry reg) {
  reg.register(CommonCodes.rateLimited,
      (ctx, f) => BusinessFailureLocalizations.of(ctx)!.biz_rate_limited);

  reg.register(CommonCodes.maintenance,
      (ctx, f) => BusinessFailureLocalizations.of(ctx)!.biz_maintenance);

  reg.register(CommonCodes.serverBusy,
      (ctx, f) => BusinessFailureLocalizations.of(ctx)!.biz_service_busy);
  reg.register(CommonCodes.unknown,
      (ctx, f) => BusinessFailureLocalizations.of(ctx)!.biz_unknown(f.code));
}
