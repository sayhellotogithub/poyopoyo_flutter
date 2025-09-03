// -------------------------------------------------------------------
// Author: WANG JUN
// Date: 2025/09/02
// Description:
// -------------------------------------------------------------------
import 'package:di/action_policy_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:localization/localiztion.dart';
import 'package:ui/src/error/presenter.dart';

import 'config.dart';

/// UI behavior configuration (can be overridden at the App layer)
final unifiedErrorUiConfigProvider = Provider<UnifiedErrorUiConfig>((_) {
  throw UnimplementedError('Provide UnifiedErrorUiConfig via override.');
});

final unifiedErrorPresenterProvider = Provider<UnifiedErrorPresenter>(
  (ref) {
    return UnifiedErrorPresenter(
      policy: ref.watch(actionPolicyProvider),
      localizer: ref.watch(failureLocalizerProvider),
      config: ref.watch(unifiedErrorUiConfigProvider),
    );
  },
  dependencies: [actionPolicyProvider, failureLocalizerProvider],
);

extension UnifiedErrorPresenterX on UnifiedErrorPresenter {
  static UnifiedErrorPresenter of(WidgetRef ref) =>
      ref.read(unifiedErrorPresenterProvider);
}
