// -------------------------------------------------------------------
// Author: WANG JUN
// Date: 2025/09/04
// Description:
// -------------------------------------------------------------------
import 'package:design_patterns/src/command.dart';
import 'package:design_patterns/src/light.dart';
import 'package:design_patterns/src/remote_control.dart';

void main() {
  var light = Light();
  var remoteControl = RemoteControl();
  remoteControl.setCommand(TurnOnCommand(light));
  remoteControl.pressButton();
  remoteControl.setCommand(TurnOffCommand(light));
  remoteControl.pressButton();
}
