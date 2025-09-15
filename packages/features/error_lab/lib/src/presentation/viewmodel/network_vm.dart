// -------------------------------------------------------------------
// Author: WANG JUN
// Date: 2025/09/04
// Description:
// -------------------------------------------------------------------
import 'package:action_policy/action_policy.dart';
import 'package:di/action_policy_providers.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NetErrorBean {
  final NetErrCode code;
  final NetworkFailure failure;
  final ActionDecision actionDecision;

  const NetErrorBean(this.code, this.failure, this.actionDecision);
}

class ErrorNetworkState {
  final bool loading;
  final List<NetErrorBean> codes;

  const ErrorNetworkState({this.codes = const [], this.loading = false});

  ErrorNetworkState copyWith({bool? loading, List<NetErrorBean>? codes}) =>
      ErrorNetworkState(
          loading: loading ?? this.loading, codes: codes ?? this.codes);
}

class ErrorNetworkVM extends StateNotifier<ErrorNetworkState> {
  final Ref ref;
  final ActionPolicy policy;

  ErrorNetworkVM(this.ref, this.policy) : super(const ErrorNetworkState());

  void _show() => state = state.copyWith(loading: true);

  void _hide() => state = state.copyWith(loading: false);

  Future<void> runScenario(BuildContext context) async {
    _show();
    List<NetErrorBean> codes = [];
    for (NetErrCode code in NetErrCode.values) {
      final failure = NetworkErrorPolicy.failure(code);
      codes.add(NetErrorBean(
        code,
        failure,
        decideAction(failure, policy: policy),
      ));
    }

    state = state.copyWith(loading: false, codes: [...codes]);
  }
}

final errorNetworkVMProvider =
    StateNotifierProvider.autoDispose<ErrorNetworkVM, ErrorNetworkState>((ref) {
  final policy = ref.watch(actionPolicyProvider);
  return ErrorNetworkVM(ref, policy);
}, dependencies: [actionPolicyProvider]);
