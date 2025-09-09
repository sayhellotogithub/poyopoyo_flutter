// -------------------------------------------------------------------
// Author: WANG JUN
// Date: 2025/09/02
// Description:
// -------------------------------------------------------------------
import 'package:action_policy/action_policy.dart';
import 'package:flutter/material.dart';

import '../handlers/dialog_handler.dart';
import '../handlers/toast_handler.dart';
import 'error_handing_config.dart';
import 'error_route_config.dart';

typedef ErrorActionHandler = void Function(
  BuildContext context,
  String message, {
  VoidCallback? onRetry,
  Map<String, String>? details,
});

typedef ShowSnackBar = void Function(BuildContext ctx, String text,
    {VoidCallback? onRetry});
typedef ShowDialogFn = Future<void> Function(BuildContext ctx, String text);

typedef NavigateFn = void Function(BuildContext ctx, String route);

class UnifiedErrorUiConfig {
  final Map<ErrorAction, ErrorActionHandler> _actionHandlers;
  final NavigateFn _navigateToLogin;
  final NavigateFn _navigateToKyc;
  final ErrorRouteConfig routeConfig;
  final ErrorHandlingConfig handlingConfig;

  ErrorActionHandler? getHandler(ErrorAction action) => _actionHandlers[action];

  const UnifiedErrorUiConfig._({
    required Map<ErrorAction, ErrorActionHandler> actionHandlers,
    required NavigateFn navigateToLogin,
    required NavigateFn navigateToKyc,
    required this.routeConfig,
    required this.handlingConfig,
  })  : _actionHandlers = actionHandlers,
        _navigateToLogin = navigateToLogin,
        _navigateToKyc = navigateToKyc;

  void navigateToLogin(BuildContext context) =>
      _navigateToLogin(context, routeConfig.loginRoute);

  void navigateToKyc(BuildContext context) =>
      _navigateToKyc(context, routeConfig.kycRoute);

  void handleError(
    BuildContext context,
    ErrorAction action,
    String message, {
    VoidCallback? onRetry,
    Map<String, String>? details,
  }) {
    final handler = getHandler(action);
    if (handler != null) {
      handler(context, message, onRetry: onRetry, details: details);
    } else {
      _showFallbackError(context, message, onRetry: onRetry);
    }
  }

  void _showFallbackError(
    BuildContext context,
    String message, {
    VoidCallback? onRetry,
  }) {
    toastHandler(context, message, onRetry: onRetry);
  }

  factory UnifiedErrorUiConfig.defaults({
    ShowSnackBar? showSnackBar,
    required NavigateFn navigate,
    ErrorRouteConfig routeConfig = const ErrorRouteConfig(),
    ErrorHandlingConfig? handlingConfig,
  }) {
    final config = handlingConfig ?? ErrorHandlingConfig.business();
    final snackBarHandler = showSnackBar ?? toastHandler;

    return UnifiedErrorUiConfig._(
      routeConfig: routeConfig,
      handlingConfig: config,
      actionHandlers: _createDefaultActionHandlers(
        snackBarHandler: snackBarHandler,
        config: config,
      ),
      navigateToLogin: navigate,
      navigateToKyc: navigate,
    );
  }

  factory UnifiedErrorUiConfig.custom({
    required Map<ErrorAction, ErrorActionHandler> actionHandlers,
    required NavigateFn navigate,
    ErrorRouteConfig routeConfig = const ErrorRouteConfig(),
    ErrorHandlingConfig? handlingConfig,
  }) {
    return UnifiedErrorUiConfig._(
      routeConfig: routeConfig,
      handlingConfig: handlingConfig ?? ErrorHandlingConfig.business(),
      actionHandlers: actionHandlers,
      navigateToLogin: navigate,
      navigateToKyc: navigate,
    );
  }

  static Map<ErrorAction, ErrorActionHandler> _createDefaultActionHandlers({
    required ShowSnackBar snackBarHandler,
    required ErrorHandlingConfig config,
  }) {
    return {
      ErrorAction.showToast: (context, message, {onRetry, details}) =>
          snackBarHandler(context, message, onRetry: onRetry),
      ErrorAction.retry: (context, message, {onRetry, details}) =>
          snackBarHandler(context, message, onRetry: onRetry),
      ErrorAction.showDialog: (context, message, {onRetry, details}) =>
          dialogHandler(
            context,
            message,
            onRetry: onRetry,
            details: details,
            skin: config.dialogSkin,
            textsResolver: config.textsResolver,
            dedup: config.dedupConfig,
          ),
    };
  }

  UnifiedErrorUiConfig copyWith({
    Map<ErrorAction, ErrorActionHandler>? actionHandlers,
    NavigateFn? navigateToLogin,
    NavigateFn? navigateToKyc,
    ErrorRouteConfig? routeConfig,
    ErrorHandlingConfig? handlingConfig,
  }) {
    return UnifiedErrorUiConfig._(
      actionHandlers: actionHandlers ?? _actionHandlers,
      navigateToLogin: navigateToLogin ?? _navigateToLogin,
      navigateToKyc: navigateToKyc ?? _navigateToKyc,
      routeConfig: routeConfig ?? this.routeConfig,
      handlingConfig: handlingConfig ?? this.handlingConfig,
    );
  }

  UnifiedErrorUiConfig withHandler(
    ErrorAction action,
    ErrorActionHandler handler,
  ) {
    final updatedHandlers =
        Map<ErrorAction, ErrorActionHandler>.from(_actionHandlers);
    updatedHandlers[action] = handler;
    return copyWith(actionHandlers: updatedHandlers);
  }

  UnifiedErrorUiConfig withoutHandler(ErrorAction action) {
    final updatedHandlers =
        Map<ErrorAction, ErrorActionHandler>.from(_actionHandlers);
    updatedHandlers.remove(action);
    return copyWith(actionHandlers: updatedHandlers);
  }
}

extension UnifiedErrorUiConfigExtension on UnifiedErrorUiConfig {
  void showToast(
    BuildContext context,
    String message, {
    VoidCallback? onRetry,
  }) {
    handleError(context, ErrorAction.showToast, message, onRetry: onRetry);
  }

  void showDialog(
    BuildContext context,
    String message, {
    VoidCallback? onRetry,
    Map<String, String>? details,
  }) {
    handleError(
      context,
      ErrorAction.showDialog,
      message,
      onRetry: onRetry,
      details: details,
    );
  }

  void showRetryableError(
    BuildContext context,
    String message,
    VoidCallback onRetry,
  ) {
    handleError(context, ErrorAction.retry, message, onRetry: onRetry);
  }
}
