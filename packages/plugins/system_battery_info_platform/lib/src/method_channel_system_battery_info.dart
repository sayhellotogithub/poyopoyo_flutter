// -------------------------------------------------------------------
// Author: WANG JUN
// Date: 2025/10/07
// Description:
// -------------------------------------------------------------------
import 'package:flutter/services.dart';
import 'package:system_battery_info_platform_interface/src/battery_event.dart';

import 'system_battery_info_platform.dart';

class MethodChannelSystemBatteryInfo extends SystemBatteryInfoPlatform {
  static const MethodChannel _channel =
      MethodChannel('com.poyopoyo.system_battery_info');
  static const EventChannel _eventChannel =
      EventChannel('com.poyopoyo.system_battery_info/events');

  @override
  Future<int> getBatteryLevel() async {
    final level = await _channel.invokeMethod<int>('getBatteryLevel');
    return level ?? -1;
  }

  @override
  Stream<BatteryEvent> get onBatteryChanged =>
      _eventChannel.receiveBroadcastStream().map((event) {
        final map = Map<String, dynamic>.from(event);
        return BatteryEvent.fromMap(map);
      });
}
