// -------------------------------------------------------------------
// Author: WANG JUN
// Date: 2025/08/26
// Description:
// -------------------------------------------------------------------
import 'package:design_patterns/src/render.dart';

abstract class Shape {
  Renderer renderer;

  Shape(this.renderer);

  void draw();
}

class Circle extends Shape {
  Circle(Renderer renderer) : super(renderer);

  @override
  void draw() {
    renderer.render("Circle");
  }
}
