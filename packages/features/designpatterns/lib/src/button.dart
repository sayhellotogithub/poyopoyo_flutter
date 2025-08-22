// -------------------------------------------------------------------
// Author: WANG JUN
// Date: 2025/08/22
// Description:
// -------------------------------------------------------------------
abstract class Button {
  void render();
}

class MaterialButton extends Button {
  @override
  void render() {
    print("Material Button");
  }
}

class CupertinoButton extends Button {
  @override
  void render() {
    print("Cupertino Button");
  }
}
