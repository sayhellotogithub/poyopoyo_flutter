// -------------------------------------------------------------------
// Author: WANG JUN
// Date: 2025/09/09
// Description:
// -------------------------------------------------------------------
import 'colleague.dart';

abstract class Mediator {
  void notify(Colleague sender, String event);
}

class UIControlMediator implements Mediator {
  late Button button;
  late Text textBox;

  @override
  void notify(Colleague sender, String event) {
    if (sender == button && event == "click")
      textBox.receive("Button clicked → clear text");
    else if (sender == textBox && event.startsWith("input:"))
      button.receive("TextBox changed → enable button");
  }
}
