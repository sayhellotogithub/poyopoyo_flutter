// -------------------------------------------------------------------
// Author: WANG JUN
// Date: 2025/09/04
// Description:
// -------------------------------------------------------------------
import 'light.dart';

abstract class Command {
  void execute();
}

class TurnOnCommand implements Command {
  final Light light;

  TurnOnCommand(this.light);

  @override
  void execute() {
    light.turnOn();
  }
}

class TurnOffCommand implements Command {
  Light light;

  TurnOffCommand(this.light);

  @override
  void execute() {
    light.turnOff();
  }
}
