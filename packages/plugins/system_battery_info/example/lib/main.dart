import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:system_battery_info/system_battery_info.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _batteryLevel = 'Unknown';
  final _systemBatteryInfoPlugin = SystemBatteryInfo();

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String batteryLevel = "";
    try {
      batteryLevel = await _systemBatteryInfoPlugin.getBatteryLevel().then(
        (value) => value?.toString() ?? 'Unknown',
      );
    } on PlatformException {
      batteryLevel = 'Failed to get platform version.';
    }
    if (!mounted) return;

    setState(() {
      _batteryLevel = batteryLevel;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Plugin example app')),
        body: Center(child: Text('Battery Level : $_batteryLevel\n')),
      ),
    );
  }
}
