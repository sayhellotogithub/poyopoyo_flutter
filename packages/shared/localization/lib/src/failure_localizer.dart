// -------------------------------------------------------------------
// Author: WANG JUN
// Date: 2025/08/15
// Description:
// -------------------------------------------------------------------
import 'package:action_policy/action_policy.dart';
import 'package:business_failure_i18n/business_failure_i18n.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:network_failure_i18n/network_i18n.dart';

final failureLocalizerProvider = Provider<FailureLocalizer>((ref) {
  final net = ref.watch(networkFailureLocalizerProvider);
  final biz = ref.watch(businessFailureLocalizerProvider);
  return FailureLocalizer(net: net, biz: biz);
});

class FailureLocalizer {
  final NetworkFailureLocalizer net;
  final BusinessFailureLocalizer biz;

  const FailureLocalizer({required this.net, required this.biz});

  String localize(BuildContext ctx, Failure f) {
    if (f is NetworkFailure) return net.localize(ctx, f);
    if (f is BizFailure) return biz.localize(ctx, f);
    return BusinessFailureLocalizations.of(ctx)!.biz_unknown("unknown");
  }
}

extension FailureLocalizerX on FailureLocalizer {
  static FailureLocalizer of(WidgetRef ref) =>
      ref.read(failureLocalizerProvider);
}
