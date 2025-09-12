// -------------------------------------------------------------------
// Author: WANG JUN
// Date: 2025/09/12
// Description:
// -------------------------------------------------------------------
import 'package:design_patterns/src/caretaker.dart';
import 'package:design_patterns/src/originator.dart';

void main() {
  var originator = Originator();
  var caretaker = Caretaker();

  originator.setState("State 1");
  caretaker.addMemento(originator.save());

  originator.setState("State 2");
  caretaker.addMemento(originator.save());

  originator.setState("State 3");

  if (caretaker.getMemento(-1) != null)
    originator.restore(caretaker.getMemento(2)!); // State 1 に戻る
  print("Current State: " + originator.getState());
}
