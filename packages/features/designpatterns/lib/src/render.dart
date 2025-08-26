// -------------------------------------------------------------------
// Author: WANG JUN
// Date: 2025/08/26
// Description:
// -------------------------------------------------------------------
abstract class Renderer {
  void render(String shape);
}

class VectorRenderer implements Renderer {
  @override
  void render(String shape) {
    print("Drawing $shape as lines");
  }
}

class RasterRenderer implements Renderer {
  @override
  void render(String shape) {
    print("Drawing $shape as pixels");
  }
}
