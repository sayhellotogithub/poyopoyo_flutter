// -------------------------------------------------------------------
// Author: WANG JUN
// Date: 2025/08/22
// Description:
// -------------------------------------------------------------------
import 'button.dart';
import 'text_field.dart';

abstract class WidgetFactory {
  Button createButton();

  TextField createTextField();
}

class MaterialWidgetFactory implements WidgetFactory {
  @override
  Button createButton() {
    return MaterialButton();
  }

  @override
  TextField createTextField() {
    return MaterialTextField();
  }
}

class CupertinoWidgetFactory implements WidgetFactory {
  @override
  Button createButton() {
    return CupertinoButton();
  }

  @override
  TextField createTextField() {
    return CupertinoTextField();
  }
}
