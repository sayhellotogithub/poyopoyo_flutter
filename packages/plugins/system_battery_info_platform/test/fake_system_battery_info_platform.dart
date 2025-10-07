// -------------------------------------------------------------------
// Author: WANG JUN
// Date: 2025/10/07
// Description:
// -------------------------------------------------------------------
import 'package:system_battery_info_platform_interface/src/battery_event.dart';
import 'package:system_battery_info_platform_interface/src/system_battery_info_platform.dart';

class FakeSystemBatteryInfoPlatform extends SystemBatteryInfoPlatform {
  @override
  Future<int?> getBatteryLevel() async => 99;

  @override
  Stream<BatteryEvent> get onBatteryChanged async* {
    yield BatteryEvent(level: 99, isCharging: true);
  }
}
