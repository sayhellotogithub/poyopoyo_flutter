// -------------------------------------------------------------------
// Author: WANG JUN
// Date: 2025/09/02
// Description:
// -------------------------------------------------------------------
import 'package:action_policy/action_policy.dart';
import 'package:domain/domain.dart';
import 'package:flutter/widgets.dart';
import 'package:localization/localiztion.dart';

import 'config.dart';

abstract class IUnifiedErrorPresenter {
  Future<T?> guard<T>(BuildContext ctx, Future<T> Function() task);
}

class UnifiedErrorPresenter implements IUnifiedErrorPresenter {
  final ActionPolicy policy;
  final FailureLocalizer localizer;
  final UnifiedErrorUiConfig config;

  const UnifiedErrorPresenter({
    required this.policy,
    required this.localizer,
    required this.config,
  });

  /// Handle a Failure directly: Decision → Copywriting → UI
  Future<void> handle(BuildContext context, Failure f,
      {VoidCallback? onRetry}) async {
    final decision = decideAction(f, policy: policy); // 纯 Dart
    final msg = localizer.localize(context, f);

    switch (decision.action) {
      case ErrorAction.reauth:
        config.navigateToLogin(context);
        _toastLike(context, msg);
        break;
      case ErrorAction.navigateKyc:
        config.navigateToKyc(context);
        _toastLike(context, msg);
        break;
      default:
        final h = config.getHandler(decision.action) ??
            config.getHandler(ErrorAction.showDialog);
        h?.call(context, msg, onRetry: onRetry);
        break;
    }
  }

  /// Package a task that may throw Failure: display UI uniformly when failure occurs
  @override
  Future<T?> guard<T>(BuildContext context, Future<T> Function() task,
      {VoidCallback? onRetry}) async {
    try {
      return await task();
    } on Failure catch (f) {
      await handle(context, f, onRetry: onRetry);
      return null;
    }
  }

  void _toastLike(BuildContext ctx, String text) {
    final h = config.getHandler(ErrorAction.showToast) ??
        config.getHandler(ErrorAction.showDialog);
    h?.call(ctx, text);
  }
}
