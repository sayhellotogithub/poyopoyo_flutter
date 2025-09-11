// -------------------------------------------------------------------
// Author: WANG JUN
// Date: 2025/09/11
// Description:
// -------------------------------------------------------------------
import 'package:design_patterns/src/expression.dart';

void main() {
  Expression expr = AdditionExpression(
    NumberExpression(1),
    NumberExpression(2),
  );

  print(expr.interpret());
}
