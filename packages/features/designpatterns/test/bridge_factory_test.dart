// -------------------------------------------------------------------
// Author: WANG JUN
// Date: 2025/08/26
// Description:
// -------------------------------------------------------------------
import 'package:design_patterns/src/render.dart';
import 'package:design_patterns/src/shape.dart';

void main() {
  final vectorCircle = Circle(VectorRenderer());
  vectorCircle.draw();

  final rasterCircle = Circle(RasterRenderer());
  rasterCircle.draw();
}
