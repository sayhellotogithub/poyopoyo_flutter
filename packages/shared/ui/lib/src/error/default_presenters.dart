// -------------------------------------------------------------------
// Author: WANG JUN
// Date: 2025/08/15
// Description:
// -------------------------------------------------------------------
import 'package:flutter/material.dart';
import 'package:ui/src/error/error_presenters.dart';

class DefaultDialogPresenter implements DialogPresenter {
  @override
  Future<void> showMessage(BuildContext ctx, String message) {
    return showDialog(
        context: ctx,
        builder: (ctx) => AlertDialog(
              title: Text(message),
            ));
  }
}

class DefaultToastPresenter implements ToastPresenter {
  @override
  void showToast(BuildContext ctx, String message) {
    ScaffoldMessenger.of(ctx).showSnackBar(SnackBar(content: Text(message)));
  }
}

class DefaultRouterPresenter implements RouterPresenter {
  @override
  void goLogin(BuildContext ctx) {
    // Navigator.of(ctx).pushNamed('/login');
    //todo
  }
}

class NoopFormErrorBinder implements FormErrorBinder {
  @override
  void bindFieldErrors(BuildContext ctx, Map<String, Object> fieldErrors) {
    // TODO: implement bindFieldErrors
  }
}

class DefaultThreedsPresenter implements ThreedsPresenter {
  @override
  Future<void> start3DS(BuildContext ctx, {required String token}) {
    // TODO: implement start3DS
    throw UnimplementedError();
  }
}
