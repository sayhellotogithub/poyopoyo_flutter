// // -------------------------------------------------------------------
// // Author: WANG JUN
// // Date: 2025/07/18
// // Description:
// // -------------------------------------------------------------------
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:poyopoyo_weather/src/presentation/theme/app_theme.dart';
//
// import '../../data/repositories/theme_repository_impl.dart';
// import '../../domain/repositories/theme_repository.dart';
//
// final themeModeProvider = StateProvider<ThemeMode>((ref) {
//   return ThemeMode.light; // 可以后续 load 初始化
// });
//
// final themePrefsProvider = Provider<ThemeRepository>((ref) {
//   return ThemeRepositoryImpl();
// });
//
// final customThemeProvider = Provider<ThemeData>((ref) {
//   final mode = ref.watch(themeModeProvider);
//   return switch (mode) {
//     ThemeMode.light => AppTheme.lightTheme,
//     ThemeMode.dark => AppTheme.darkTheme,
//     ThemeMode.system =>
//       WidgetsBinding.instance.platformDispatcher.platformBrightness ==
//               Brightness.dark
//           ? AppTheme.darkTheme
//           : AppTheme.lightTheme,
//   };
// });
