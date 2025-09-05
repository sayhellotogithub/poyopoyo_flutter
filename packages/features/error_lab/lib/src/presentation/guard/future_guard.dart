// -------------------------------------------------------------------
// Author: WANG JUN
// Date: 2025/09/04
// Description:
// -------------------------------------------------------------------
// src/guards/future_guard.dart
import 'package:action_policy/action_policy.dart';
import 'package:flutter/widgets.dart';
import 'package:network_core/core.dart';
import 'package:ui/ui.dart';

class FutureGuard {
  final BuildContext context;
  final UnifiedErrorPresenter presenter;

  const FutureGuard(this.context, this.presenter);

  Future<T?> run<T>({
    required Future<T> Function() task,
    required VoidCallback onStart,
    required VoidCallback onComplete,
    required void Function(T data) onSuccess,
    Future<void> Function()? onRetry, // 可选：自动重试逻辑
  }) async {
    try {
      onStart();
      final data = await task();
      onSuccess(data);
      return data;
    } catch (e) {
      final failure = e is Failure ? e : NetworkFailure(NetUnknown(e));
      await presenter.handle(context, failure);
      return null;
    } finally {
      onComplete();
    }
  }
}
