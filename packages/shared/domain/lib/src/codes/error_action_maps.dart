// -------------------------------------------------------------------
// Author: WANG JUN
// Date: 2025/08/14
// Description:
// -------------------------------------------------------------------

import 'package:action_policy/action_policy.dart';

import 'common_codes.dart';

const Set<int> kDefaultRetryableHttpStatuses = {429, 502, 503, 504};

const Map<String, ErrorAction> kDirectCodeActions = {


  CommonCodes.serverBusy: ErrorAction.retry,
  CommonCodes.rateLimited: ErrorAction.retry,
};
const Map<BizCategory, ErrorAction> kCategoryDefaults = {
  BizCategory.auth: ErrorAction.reauth,
  BizCategory.general: ErrorAction.showDialog,
};

class ErrorActionOverrides {
  final Map<String, ErrorAction> codeOverrides;
  final Map<BizCategory, ErrorAction> categoryOverrides;

  const ErrorActionOverrides({
    this.codeOverrides = const {},
    this.categoryOverrides = const {},
  });
}
