// -------------------------------------------------------------------
// Author: WANG JUN
// Date: 2025/09/08
// Description:
// -------------------------------------------------------------------
import 'package:design_patterns/src/element.dart';
import 'package:design_patterns/src/visitor.dart';

void main() {
  List<Element> elements = [ConcreteElementA(), ConcreteElementB()];
  PrintVisitor visitor = PrintVisitor();
  for (Element element in elements) {
    element.accept(visitor);
  }
}
