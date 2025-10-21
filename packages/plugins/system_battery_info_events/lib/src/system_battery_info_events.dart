// -------------------------------------------------------------------
// Author: WANG JUN
// Date: 2025/10/08
// Description:
// -------------------------------------------------------------------

import 'package:system_battery_info_platform_interface/system_battery_info_platform_interface.dart';


import 'battery_event_stream.dart';

class SystemBatteryInfoEvents {
  static Stream<BatteryEvent> get onBatteryChanged => BatteryEventStream.stream;
}
