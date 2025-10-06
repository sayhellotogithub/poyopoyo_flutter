import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'system_battery_info_method_channel.dart';

abstract class SystemBatteryInfoPlatform extends PlatformInterface {
  /// Constructs a SystemBatteryInfoPlatform.
  SystemBatteryInfoPlatform() : super(token: _token);

  static final Object _token = Object();

  static SystemBatteryInfoPlatform _instance = MethodChannelSystemBatteryInfo();

  /// The default instance of [SystemBatteryInfoPlatform] to use.
  ///
  /// Defaults to [MethodChannelSystemBatteryInfo].
  static SystemBatteryInfoPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [SystemBatteryInfoPlatform] when
  /// they register themselves.
  static set instance(SystemBatteryInfoPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<int?> getBatteryLevel() {
    throw UnimplementedError('getBatteryLevel() has not been implemented.');
  }

  Future<String?> getBatteryState() async {
    throw UnimplementedError('getState() has not been implemented.');
  }
}
