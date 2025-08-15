// -------------------------------------------------------------------
// Author: WANG JUN
// Date: 2025/08/15
// Description:
// -------------------------------------------------------------------
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:localization/localiztion.dart';
import 'package:ui/src/error/error_presenters.dart';

class ErrorHandler {
  final DialogPresenter dialogs;
  final ToastPresenter toasts;
  final RouterPresenter router;
  final FormErrorBinder formBinder;
  final ThreedsPresenter threeDS;

  const ErrorHandler({
    required this.dialogs,
    required this.toasts,
    required this.router,
    required this.formBinder,
    required this.threeDS,
  });

  Future<void> handle(BuildContext ctx, Failure f) async {
    final decision = decideAction(f);
    final msg = FailureLocalizer.of(ctx).localize(
      _codeOf(f),
      fallback: _fallbackMessage(ctx, f),
    );

    switch (decision.action) {
      case ErrorAction.reauth:
        toasts.showToast(ctx, msg); // 可选：先提示
        router.goLogin(ctx);
        break;

      case ErrorAction.retry:
        toasts.showToast(ctx, msg); // 交给调用方触发 retry
        break;

      case ErrorAction.showForm:
        // formBinder.bindFieldErrors(ctx, _extractFieldErrors(f));
        //todo
        toasts.showToast(ctx, msg);
        break;

      case ErrorAction.require3DS:
        await threeDS.start3DS(ctx, token: _extract3DSToken(f));
        break;

      case ErrorAction.showDialog:
        await dialogs.showMessage(ctx, msg);
        break;

      case ErrorAction.showToast:
        toasts.showToast(ctx, msg);
        break;

      case ErrorAction.none:
        break;
    }
  }

  String _codeOf(Failure f) {
    if (f is BizFailure) return f.code;
    if (f is NetworkFailure) {
      final e = f.cause;
      return e.runtimeType.toString();
    }
    return 'UNKNOWN';
  }

  String _fallbackMessage(BuildContext ctx, Failure f) {
    return 'エラーが発生しました。しばらくしてから、もう一度お試しください。';
  }

  Map<String, Object?> _extractFieldErrors(Failure f) {
    if (f is BizFailure) {
      return f.extra;
    }
    return const {};
  }

  String _extract3DSToken(Failure f) {
    if (f is BizFailure) {
      return f.extra['3dsToken'] as String? ?? '';
    }
    return '';
  }
}
