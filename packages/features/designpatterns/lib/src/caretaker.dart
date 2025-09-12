// -------------------------------------------------------------------
// Author: WANG JUN
// Date: 2025/09/12
// Description:
// -------------------------------------------------------------------
import 'package:design_patterns/src/memento.dart';

class Caretaker {
  final List<Memento> _history = [];

  void addMemento(Memento memento) => _history.add(memento);

  Memento? getMemento(int index) {
    if (index < 0) {
      return null;
    }

    if (_history.length > index) {
      return _history[index];
    }
    return null;
  }
}
