// -------------------------------------------------------------------
// Author: WANG JUN
// Date: 2025/09/10
// Description:
// -------------------------------------------------------------------
import 'package:design_patterns/src/aggregate.dart';

void main() {
  var collection = NumberCollection([1, 2, 3, 4, 5]);
  var it = collection.createIterator();
  while (it.hasNext()) {
    print(it.next());
  }
}
