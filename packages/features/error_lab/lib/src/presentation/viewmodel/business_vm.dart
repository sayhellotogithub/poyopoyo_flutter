// -------------------------------------------------------------------
// Author: WANG JUN
// Date: 2025/09/08
// Description:
// -------------------------------------------------------------------
import 'package:action_policy/action_policy.dart';
import 'package:business_failure_i18n/business_failure_i18n.dart';
import 'package:di/action_policy_providers.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BusinessErrorBean {
  final String code;
  final BizFailure failure;
  final ActionDecision actionDecision;

  const BusinessErrorBean(this.code, this.failure, this.actionDecision);
}

class BusinessErrorState {
  final bool loading;
  final List<BusinessErrorBean> codes;

  const BusinessErrorState({this.codes = const [], this.loading = false});

  BusinessErrorState copyWith(
          {bool? loading, List<BusinessErrorBean>? codes}) =>
      BusinessErrorState(
          loading: loading ?? this.loading, codes: codes ?? this.codes);
}

class BusinessErrorVM extends StateNotifier<BusinessErrorState> {
  final Ref _ref;
  final ActionPolicy _policy;

  BusinessErrorVM(this._ref, this._policy) : super(const BusinessErrorState());

  void _show() => state = state.copyWith(loading: true);

  void _hide() => state = state.copyWith(loading: false);

  Future<void> runScenario(BuildContext context) async {
    _show();
    Map<String, BizFormatter> formatters =
        _ref.read(bizFailureRegistryProvider).formatters;
    List<BusinessErrorBean> codes = [];

    for (var entry in formatters.entries) {
      final failure = BizFailure(code: entry.key, message: "");
      final decision = decideAction(failure, policy: _policy);
      codes.add(BusinessErrorBean(entry.key, failure, decision));
    }
    state = state.copyWith(codes: codes);
    _hide();
  }
}

final errorBusinessVMProvider =
    StateNotifierProvider.autoDispose<BusinessErrorVM, BusinessErrorState>(
        (ref) {
  final policy = ref.watch(actionPolicyProvider);
  return BusinessErrorVM(ref, policy);
},dependencies: [actionPolicyProvider]);
