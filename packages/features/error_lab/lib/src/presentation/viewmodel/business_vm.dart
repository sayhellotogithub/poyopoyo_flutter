// -------------------------------------------------------------------
// Author: WANG JUN
// Date: 2025/09/08
// Description:
// -------------------------------------------------------------------
import 'package:action_policy/action_policy.dart';
import 'package:business_failure_i18n/business_failure_i18n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BusinessErrorBean {
  final String code;
  final BizFailure failure;

  const BusinessErrorBean(this.code, this.failure);
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
  final Ref ref;

  BusinessErrorVM(this.ref) : super(const BusinessErrorState());

  void _show() => state = state.copyWith(loading: true);

  void _hide() => state = state.copyWith(loading: false);

  Future<void> runScenario(BuildContext context) async {
    _show();
    Map<String, BizFormatter> formatters =
        ref.read(bizFailureRegistryProvider).formatters;
    List<BusinessErrorBean> codes = [];

    for (var entry in formatters.entries) {
      codes.add(BusinessErrorBean(
          entry.key, BizFailure(code: entry.key, message: "")));
    }
    state = state.copyWith(codes: codes);
    _hide();
  }
}

final errorBusinessVMProvider =
    StateNotifierProvider<BusinessErrorVM, BusinessErrorState>(
  (ref) => BusinessErrorVM(ref),
);
