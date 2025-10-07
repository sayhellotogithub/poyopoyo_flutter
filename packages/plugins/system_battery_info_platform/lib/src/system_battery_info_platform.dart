// -------------------------------------------------------------------
// Author: WANG JUN
// Date: 2025/10/07
// Description:
// -------------------------------------------------------------------
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'battery_event.dart';
import 'method_channel_system_battery_info.dart';

abstract class SystemBatteryInfoPlatform extends PlatformInterface {
  SystemBatteryInfoPlatform() : super(token: _token);
  static final Object _token = Object();
  static SystemBatteryInfoPlatform _instance = MethodChannelSystemBatteryInfo();

  static SystemBatteryInfoPlatform get instance => _instance;

  static set instance(SystemBatteryInfoPlatform instance) {
    PlatformInterface.verify(instance, _token);
    _instance = instance;
  }

  Future<int?> getBatteryLevel();

  Stream<BatteryEvent> get onBatteryChanged;
}
