import 'package:flutter/services.dart';

import 'system_battery_info_platform_interface.dart';

class SystemBatteryInfo {
  Future<int?> getBatteryLevel() async {
    return await SystemBatteryInfoPlatform.instance.getBatteryLevel();
    // try {
    //
    // } on PlatformException catch (e) {
    //   print('Error: ${e.message}');
    //   return null;
    // }
  }
}
