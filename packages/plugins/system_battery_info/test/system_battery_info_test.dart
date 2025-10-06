import 'package:flutter_test/flutter_test.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';
import 'package:system_battery_info/system_battery_info.dart';
import 'package:system_battery_info/system_battery_info_method_channel.dart';
import 'package:system_battery_info/system_battery_info_platform_interface.dart';

class MockSystemBatteryInfoPlatform
    with MockPlatformInterfaceMixin
    implements SystemBatteryInfoPlatform {
  @override
  Future<int?> getBatteryLevel() {
    return Future.value(42);
  }

  @override
  Future<String?> getBatteryState() {
    return Future.value('charging');
  }
}

void main() {
  final SystemBatteryInfoPlatform initialPlatform =
      SystemBatteryInfoPlatform.instance;

  test('$MethodChannelSystemBatteryInfo is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelSystemBatteryInfo>());
  });

  test('getBatteryLevel', () async {
    SystemBatteryInfo systemBatteryInfoPlugin = SystemBatteryInfo();
    MockSystemBatteryInfoPlatform fakePlatform =
        MockSystemBatteryInfoPlatform();
    SystemBatteryInfoPlatform.instance = fakePlatform;

    expect(await systemBatteryInfoPlugin.getBatteryLevel(), 42);
  });
}
