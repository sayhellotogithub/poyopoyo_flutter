// -------------------------------------------------------------------
// Author: WANG JUN
// Date: 2025/09/09
// Description:
// -------------------------------------------------------------------
import 'package:design_patterns/src/mediator.dart';

abstract class Colleague {
  Mediator mediator;

  Colleague(this.mediator);

  void send(String event) {
    mediator.notify(this, event);
  }

  void receive(String event);
}

class Button extends Colleague {
  Button(Mediator mediator) : super(mediator);

  void click() => send("click");

  @override
  void receive(String event) {
    print("Button received: $event");
  }
}

class Text extends Colleague {
  Text(Mediator mediator) : super(mediator);

  void input(String text) => send("input:$text");

  @override
  void receive(String event) {
    print("Text received: $event");
  }
}
