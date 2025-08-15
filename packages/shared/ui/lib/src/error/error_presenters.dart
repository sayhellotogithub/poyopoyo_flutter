// -------------------------------------------------------------------
// Author: WANG JUN
// Date: 2025/08/15
// Description:
// -------------------------------------------------------------------
import 'package:flutter/material.dart';

abstract class DialogPresenter {
  Future<void> showMessage(BuildContext ctx, String message);
}

abstract class ToastPresenter {
  void showToast(BuildContext ctx, String message);
}

abstract class RouterPresenter {
  void goLogin(BuildContext ctx);
}

abstract class ThreedsPresenter {
  Future<void> start3DS(BuildContext ctx, {required String token});
}

abstract class FormErrorBinder {
  void bindFieldErrors(BuildContext ctx, Map<String, Object> fieldErrors);
}
