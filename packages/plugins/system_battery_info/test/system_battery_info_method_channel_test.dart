import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:system_battery_info/system_battery_info.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  const channel = MethodChannel('system_battery_info');
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, (MethodCall call) async {
          if (call.method == 'getBatteryLevel') return 42;
          return null;
        });
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, null);
  });

  test('mocked battery level', () async {
    final result = await SystemBatteryInfo().getBatteryLevel();
    expect(result, 42);
  });
}
