// -------------------------------------------------------------------
// Author: WANG JUN
// Date: 2025/08/22
// Description:
// -------------------------------------------------------------------
abstract class TextField {
  void render();
}

class MaterialTextField implements TextField {
  @override
  void render() {
    print("Material TextField");
  }
}

class CupertinoTextField implements TextField {
  @override
  void render() {
    print("Cupertino TextField");
  }
}
