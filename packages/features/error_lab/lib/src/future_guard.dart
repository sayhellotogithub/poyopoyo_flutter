// // -------------------------------------------------------------------
// // Author: WANG JUN
// // Date: 2025/08/21
// // Description:
// // -------------------------------------------------------------------
// import 'package:action_policy/action_policy.dart';
// import 'package:domain/domain.dart';
// import 'package:error_lab/src/presentation/widgets/loading_overlay.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:network_core/core.dart';
// import 'package:ui/ui.dart';
//
// typedef FutureCallback<T> = Future<AppResult<T>> Function();
//
// class FutureGuard {
//   final BuildContext ctx;
//   final ErrorHandler handler;
//
//   const FutureGuard(this.ctx, this.handler);
//
//   static FutureGuard of(BuildContext context, WidgetRef ref) =>
//       FutureGuard(context, ref.read(errorHandlerProvider));
//
//   Future<void> run<T>({
//     required Future<AppResult<T>> Function() task,
//     required void Function(T value) onSuccess,
//     VoidCallback? onStart,
//     VoidCallback? onComplete,
//     Future<void> Function()? onRetry,
//   }) async {
//     try {
//       onStart?.call();
//       final result = await task();
//       onComplete?.call();
//
//       await result.fold(
//         (data) async {
//           onSuccess(data);
//         },
//         (failure) async {
//           await handler.handle(ctx, failure);
//           if (onRetry != null) {
//             await onRetry();
//           }
//         },
//       );
//     } catch (e) {
//       onComplete?.call();
//       await handler.handle(ctx, NetworkFailure(NetUnknown(e)));
//     }
//   }
//
//   Future<void> runV1<T>({
//     required Future<AppResult<T>> Function() task,
//     required void Function(T value) onSuccess,
//     bool showLoading = true,
//     Future<void> Function()? onRetry,
//   }) async {
//     try {
//       _showFallbackLoading(ctx);
//       final result = await task();
//       _hideFallbackLoading.call(ctx);
//
//       await result.fold(
//         (data) async {
//           onSuccess(data);
//         },
//         (failure) async {
//           await handler.handle(ctx, failure);
//           if (onRetry != null) {
//             await onRetry();
//           }
//         },
//       );
//     } catch (e) {
//       _hideFallbackLoading.call(ctx);
//       await handler.handle(ctx, NetworkFailure(NetUnknown(e)));
//     }
//   }
//
//   Future<void> _showFallbackLoading(BuildContext context) {
//     return showLoading(context);
//   }
//
//   void _hideFallbackLoading(BuildContext context) {
//     hideLoading(context);
//   }
// }
