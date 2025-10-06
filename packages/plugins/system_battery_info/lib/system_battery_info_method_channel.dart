import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'system_battery_info_platform_interface.dart';

/// An implementation of [SystemBatteryInfoPlatform] that uses method channels.
class MethodChannelSystemBatteryInfo extends SystemBatteryInfoPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('system_battery_info');

  @override
  Future<int?> getBatteryLevel() async {
    return methodChannel.invokeMethod<int>('getBatteryLevel');
  }

  @override
  Future<String?> getBatteryState() async {
    return methodChannel.invokeMethod<String>('getBatteryState');
  }
}
