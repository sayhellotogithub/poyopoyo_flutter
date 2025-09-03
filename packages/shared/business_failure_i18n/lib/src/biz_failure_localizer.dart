// -------------------------------------------------------------------
// Author: WANG JUN
// Date: 2025/08/25
// Description:
// -------------------------------------------------------------------
import 'package:action_policy/action_policy.dart';
import 'package:domain/domain.dart';
import 'package:flutter/widgets.dart';

import '../l10n/business_failure_localizations.dart';
import 'biz_registry.dart';

class BusinessFailureLocalizer {
  final BizFailureRegistry registry;

  const BusinessFailureLocalizer(this.registry);

  String localize(BuildContext context, BizFailure f) {
    // Go to the registrar first (feature code → copy)
    final reg = registry.tryFormat(context, f);
    if (reg != null) return reg;

    // If no configuration is available, use the general fallback method.
    final s = BusinessFailureLocalizations.of(context)!;
    final codeText = f.code.toString();
    return s.biz_unknown(codeText);
  }
}
