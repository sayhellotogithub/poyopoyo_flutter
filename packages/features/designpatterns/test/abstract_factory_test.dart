// -------------------------------------------------------------------
// Author: WANG JUN
// Date: 2025/08/22
// Description:
// -------------------------------------------------------------------
import 'package:design_patterns/src/widget_factory.dart';

void main() {
  WidgetFactory factory = MaterialWidgetFactory();
  var button = factory.createButton();
  var textField = factory.createTextField();

  button.render();
  textField.render();

  factory = CupertinoWidgetFactory();
  button = factory.createButton();
  textField = factory.createTextField();
  button.render();
  textField.render();
}
