// -------------------------------------------------------------------
// Author: WANG JUN
// Date: 2025/08/26
// Description:
// -------------------------------------------------------------------
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../business_failure_i18n.dart';
import 'biz_failure_localizer.dart';
import 'biz_registry.dart';

final bizFailureRegistryProvider = Provider<BizFailureRegistry>((_) {
  final reg = BizFailureRegistry(allowOverride: true);
  registerCommonBizI18n(reg);
  return reg;
});


final businessFailureLocalizerProvider =
    Provider<BusinessFailureLocalizer>((ref) {
  final reg = ref.watch(bizFailureRegistryProvider);
  return BusinessFailureLocalizer(reg);
});
