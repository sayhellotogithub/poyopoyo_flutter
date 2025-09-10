// -------------------------------------------------------------------
// Author: WANG JUN
// Date: 2025/09/10
// Description:
// -------------------------------------------------------------------
abstract class Iterator<T> {
  bool hasNext();

  T next();
}

class NumberIterator implements Iterator<int> {
  final List<int> _numbers;
  int _index = 0;

  NumberIterator(this._numbers);

  @override
  bool hasNext() => _index < _numbers.length;

  @override
  int next() {
    if (hasNext()) {
      return _numbers[_index++];
    } else {
      throw Exception("No more elements");
    }
  }
}
