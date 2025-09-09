// -------------------------------------------------------------------
// Author: WANG JUN
// Date: 2025/09/09
// Description:
// -------------------------------------------------------------------
import 'package:design_patterns/src/colleague.dart';
import 'package:design_patterns/src/mediator.dart';

void main() {
  final mediator = UIControlMediator();
  final button = Button(mediator);
  final textBox = Text(mediator);
  mediator.button = button;
  mediator.textBox = textBox;

  textBox.input("Hello");
  button.click();
}
