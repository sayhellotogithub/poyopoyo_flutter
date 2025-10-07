// -------------------------------------------------------------------
// Author: WANG JUN
// Date: 2025/10/07
// Description:
// -------------------------------------------------------------------

import 'package:flutter_test/flutter_test.dart';
import 'package:system_battery_info_platform_interface/src/system_battery_info_platform.dart';

import 'fake_system_battery_info_platform.dart';

void main() {
  test('mocked platform returns expected value', () async {
    SystemBatteryInfoPlatform.instance = FakeSystemBatteryInfoPlatform();

    final level = await SystemBatteryInfoPlatform.instance.getBatteryLevel();
    expect(level, 99);

    final event =
        await SystemBatteryInfoPlatform.instance.onBatteryChanged.first;
    expect(event.level, 99);
    expect(event.isCharging, true);
  });
}
