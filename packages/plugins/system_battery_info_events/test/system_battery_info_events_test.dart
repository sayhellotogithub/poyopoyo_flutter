// -------------------------------------------------------------------
// Author: WANG JUN
// Date: 2025/10/08
// Description:
// -------------------------------------------------------------------

import 'package:flutter_test/flutter_test.dart';
import 'package:system_battery_info_events/system_battery_info_events.dart';

import 'fake_event_channel.dart';

void main() {
  final binding = TestWidgetsFlutterBinding.ensureInitialized();
  setUp(() {
    registerFakeEventChannel(binding);
  });

  test('receives a battery event', () async {
    final event = await SystemBatteryInfoEvents.onBatteryChanged.first
        .timeout(const Duration(seconds: 2));
    expect(event.level, 80);
    expect(event.isCharging, true);
  });

  tearDown(() {
    removeFakeEventChannel(binding);
  });
}
