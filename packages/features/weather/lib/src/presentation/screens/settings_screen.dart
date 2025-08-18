// -------------------------------------------------------------------
// Author: WANG JUN
// Date: 2025/07/18
// Description:
// -------------------------------------------------------------------

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:locale/locale.dart';
import 'package:theme/theme_provider.dart';

import '../../../l10n/weather_localizations.dart';
import '../viewmodels/settings_view_model.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(settingsViewModelProvider);
    final local = WeatherLocalizations.of(context)!;
    final themeModeAsync = ref.watch(themeModeProvider);
    final currentLocale = ref.watch(localeProvider);

    return Scaffold(
      appBar: AppBar(title: Text(local.weather_settings)),
      body: ListView(
        children: [
          ListTile(title: Text(local.weather_theme_setting)),
          RadioListTile<ThemeMode>(
            title: Text(local.weather_light),
            value: ThemeMode.light,
            groupValue: themeModeAsync.value,
            onChanged: (value) =>
                value != null ? viewModel.changeTheme(value) : null,
          ),
          RadioListTile<ThemeMode>(
            title: Text(local.weather_dark),
            value: ThemeMode.dark,
            groupValue: themeModeAsync.value,
            onChanged: (value) =>
                value != null ? viewModel.changeTheme(value) : null,
          ),
          const Divider(),
          ListTile(title: Text(local.weather_language_setting)),
          RadioListTile<Locale>(
            title: Text(local.weather_japanese),
            value: const Locale('ja'),
            groupValue: currentLocale,
            onChanged: (value) =>
                value != null ? viewModel.changeLocale(value) : null,
          ),
          RadioListTile<Locale>(
            title: Text(local.weather_english),
            value: const Locale('en'),
            groupValue: currentLocale,
            onChanged: (value) =>
                value != null ? viewModel.changeLocale(value) : null,
          ),
        ],
      ),
    );
  }
}
