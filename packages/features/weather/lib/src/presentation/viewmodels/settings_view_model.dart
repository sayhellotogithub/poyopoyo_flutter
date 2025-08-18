// -------------------------------------------------------------------
// Author: WANG JUN
// Date: 2025/07/18
// Description:
// -------------------------------------------------------------------
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:locale/locale.dart';
import 'package:theme/theme_provider.dart';

final settingsViewModelProvider = Provider((ref) {
  return SettingsViewModel(ref);
});

class SettingsViewModel {
  final Ref ref;

  SettingsViewModel(this.ref);

  Future<void> changeTheme(ThemeMode mode) async {
    ref.read(themeModeProvider.notifier).set(mode);
  }

  Future<void> changeLocale(Locale locale) async {
    ref.read(localeProvider.notifier).state = locale;
    final localeRepo = ref.read(localePrefsProvider);
    await localeRepo.saveLocale(locale);
  }
}
