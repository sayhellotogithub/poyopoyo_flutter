import 'package:flutter_test/flutter_test.dart';
import 'package:system_battery_info/system_battery_info.dart';
import 'package:system_battery_info/system_battery_info_platform_interface.dart';
import 'package:system_battery_info/system_battery_info_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockSystemBatteryInfoPlatform
    with MockPlatformInterfaceMixin
    implements SystemBatteryInfoPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final SystemBatteryInfoPlatform initialPlatform = SystemBatteryInfoPlatform.instance;

  test('$MethodChannelSystemBatteryInfo is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelSystemBatteryInfo>());
  });

  test('getPlatformVersion', () async {
    SystemBatteryInfo systemBatteryInfoPlugin = SystemBatteryInfo();
    MockSystemBatteryInfoPlatform fakePlatform = MockSystemBatteryInfoPlatform();
    SystemBatteryInfoPlatform.instance = fakePlatform;

    expect(await systemBatteryInfoPlugin.getPlatformVersion(), '42');
  });
}
