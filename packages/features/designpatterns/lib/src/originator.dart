// -------------------------------------------------------------------
// Author: WANG JUN
// Date: 2025/09/12
// Description:
// -------------------------------------------------------------------
import 'memento.dart';

class Originator {
  String _state = '';

  void setState(String state) {
    print(" Setting state to $state");
    _state = state;
  }

  String getState() => _state;

  Memento save() => Memento(_state);

  void restore(Memento memento) {
    _state = memento.state;
    print("State restored to $_state");
  }
}
