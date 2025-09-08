// -------------------------------------------------------------------
// Author: WANG JUN
// Date: 2025/09/08
// Description:
// -------------------------------------------------------------------
import 'package:design_patterns/src/element.dart';

abstract class Visitor {
  void visitElementA(ConcreteElementA element);

  void visitElementB(ConcreteElementB element);
}

class PrintVisitor extends Visitor {
  @override
  void visitElementA(ConcreteElementA element) {
    element.operationA();
    print("Visited ElementA");
  }

  @override
  void visitElementB(ConcreteElementB element) {
    element.operationB();
    print("Visited ElementB");
  }
}
