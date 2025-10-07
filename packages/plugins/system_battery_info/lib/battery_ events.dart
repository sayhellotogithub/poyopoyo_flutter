// -------------------------------------------------------------------
// Author: WANG JUN
// Date: 2025/10/07
// Description:
// -------------------------------------------------------------------
import 'package:flutter/services.dart';

class BatteryEvents {
  static const EventChannel _channel = EventChannel(
    'system_battery_info/events',
  );

  static Stream<int> get batteryLevelStream =>
      _channel.receiveBroadcastStream().cast<int>();
}
