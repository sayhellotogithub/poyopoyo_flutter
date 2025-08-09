// -------------------------------------------------------------------
// Author: WANG JUN
// Date: 2025/08/09
// Description: 
// -------------------------------------------------------------------
import 'package:contracts/auth/auth_service.dart';
import 'package:contracts/settings/settings_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authServiceProvider = Provider<AuthService>((ref) {
  throw UnimplementedError('AuthService is not provided');
});

final settingsServiceProvider = Provider<SettingsService>((ref) {
  throw UnimplementedError('SettingsService is not provided');
});