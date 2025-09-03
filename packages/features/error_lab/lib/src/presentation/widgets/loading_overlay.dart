// -------------------------------------------------------------------
// Author: WANG JUN
// Date: 2025/08/21
// Description:
// -------------------------------------------------------------------

import 'package:flutter/material.dart';

Future<void> showLoading(BuildContext context) {
  return showGeneralDialog(
    context: context,
    barrierDismissible: false,
    barrierLabel: 'Loading',
    pageBuilder: (_, __, ___) => const Material(
      color: Colors.black54,
      child: Center(child: CircularProgressIndicator()),
    ),
  );
}

void hideLoading(BuildContext context) {
  if (Navigator.of(context, rootNavigator: true).canPop()) {
    Navigator.of(context, rootNavigator: true).pop();
  }
}
