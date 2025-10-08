// -------------------------------------------------------------------
// Author: WANG JUN
// Date: 2025/10/08
// Description:
// -------------------------------------------------------------------
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:system_battery_info_events/src/event_constants.dart';

StreamController<dynamic>? _controller;
final _eventChannel = const EventChannel(EventConstants.eventChannelName);

void registerFakeEventChannel(TestWidgetsFlutterBinding binding) {
  _controller = StreamController<dynamic>();

  binding.defaultBinaryMessenger.setMockStreamHandler(
      _eventChannel,
      MockStreamHandler.inline(
        onListen: (Object? arguments, MockStreamHandlerEventSink sink) {
          sink.success({'level': 80, 'isCharging': true});
        },
        onCancel: (Object? arguments) {
          print('cancelled');
        },
      ));
}

void removeFakeEventChannel(TestWidgetsFlutterBinding binding) {
  binding.defaultBinaryMessenger.setMockStreamHandler(_eventChannel, null);
  _controller?.close();
  _controller = null;
}
