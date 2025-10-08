// -------------------------------------------------------------------
// Author: WANG JUN
// Date: 2025/10/08
// Description:
// -------------------------------------------------------------------
import 'package:flutter/services.dart';
import 'package:system_battery_info_platform_interface/system_battery_info_platform_interface.dart';

import 'event_constants.dart';

class BatteryEventStream {
  static const _eventChannel = EventChannel(EventConstants.eventChannelName);
  static Stream<BatteryEvent>? _stream;

  static Stream<BatteryEvent> get stream {
    _stream ??= _eventChannel.receiveBroadcastStream().map((dynamic event) {
      final map = Map<String, dynamic>.from(event);
      return BatteryEvent.fromMap(map);
    }).asBroadcastStream();
    return _stream!;
  }

  static void reset() => _stream = null;
}
