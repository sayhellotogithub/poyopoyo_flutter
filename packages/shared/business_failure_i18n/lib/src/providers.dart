// -------------------------------------------------------------------
// Author: WANG JUN
// Date: 2025/08/26
// Description:
// -------------------------------------------------------------------
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'biz_failure_localizer.dart';
import 'biz_registry.dart';

final bizFailureRegistryProvider =
    Provider<BizFailureRegistry>((_) => BizFailureRegistry());

final businessFailureLocalizerProvider =
    Provider<BusinessFailureLocalizer>((ref) {
  final reg = ref.watch(bizFailureRegistryProvider);
  return BusinessFailureLocalizer(reg);
});
