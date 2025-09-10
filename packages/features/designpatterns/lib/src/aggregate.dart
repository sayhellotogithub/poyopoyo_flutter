// -------------------------------------------------------------------
// Author: WANG JUN
// Date: 2025/09/10
// Description:
// -------------------------------------------------------------------
import 'iterator.dart';

abstract class Aggregate<T> {
  Iterator<T> createIterator();
}

class NumberCollection implements Aggregate<int> {
  final List<int> _numbers;

  NumberCollection(this._numbers);

  @override
  Iterator<int> createIterator() => NumberIterator(_numbers);
}
