// -------------------------------------------------------------------
// Author: WANG JUN
// Date: 2025/08/08
// Description:
// -------------------------------------------------------------------
import 'dart:async';

import 'package:theme/repository/shared_preferences_repository.dart';
import 'package:theme/theme_mapper.dart';

import '../repository/shared_preferences_repository_impl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final themeModeProvider = AsyncNotifierProvider<ThemeModeNotifier, ThemeMode>(
  ThemeModeNotifier.new,
);

final sharedPreferencesRepositoryProvider =
    Provider<SharedPreferencesRepository>(
  (ref) => SharedPreferencesRepositoryImpl(),
);

class ThemeModeNotifier extends AsyncNotifier<ThemeMode> {
  late final SharedPreferencesRepository _prefsRepo;

  @override
  FutureOr<ThemeMode> build() async {
    _prefsRepo = ref.read(sharedPreferencesRepositoryProvider);
    final appMode = await _prefsRepo.fetchAppThemeMode();
    return appMode?.toMaterialTheme() ?? ThemeMode.light;
  }

  Future<void> toggle() async {
    final next =
        state.value == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    state = AsyncValue.data(next);
    await _prefsRepo
        .saveAppThemeMode(AppThemeModeMapper.fromMaterialTheme(next));
  }
}
