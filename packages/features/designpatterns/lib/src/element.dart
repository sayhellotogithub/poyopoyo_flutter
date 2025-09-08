// -------------------------------------------------------------------
// Author: WANG JUN
// Date: 2025/09/08
// Description:
// -------------------------------------------------------------------
import 'package:design_patterns/src/visitor.dart';

abstract class Element {
  void accept(Visitor visitor);
}

class ConcreteElementA extends Element {
  void operationA() => print("ElementA operation");

  @override
  void accept(Visitor visitor) {
    visitor.visitElementA(this);
  }
}

class ConcreteElementB extends Element {
  void operationB() => print("ElementB operation");

  @override
  void accept(Visitor visitor) {
    visitor.visitElementB(this);
  }
}
