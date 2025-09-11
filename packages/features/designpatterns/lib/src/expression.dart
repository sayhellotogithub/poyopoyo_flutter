// -------------------------------------------------------------------
// Author: WANG JUN
// Date: 2025/09/11
// Description:
// -------------------------------------------------------------------

abstract class Expression {
  int interpret();
}

class NumberExpression extends Expression {
  final int _number;

  NumberExpression(this._number);

  @override
  int interpret() => _number;
}

class AdditionExpression extends Expression {
  final Expression _left;
  final Expression _right;

  AdditionExpression(this._left, this._right);

  @override
  int interpret() => _left.interpret() + _right.interpret();
}

class SubtractionExpression extends Expression {
  final Expression _left;
  final Expression _right;

  SubtractionExpression(this._left, this._right);

  @override
  int interpret() => _left.interpret() - _right.interpret();
}

class MultiplicationExpression extends Expression {
  final Expression _left;
  final Expression _right;

  MultiplicationExpression(this._left, this._right);

  @override
  int interpret() => _left.interpret() * _right.interpret();
}

class DivisionExpression extends Expression {
  final Expression _left;
  final Expression _right;

  DivisionExpression(this._left, this._right);

  @override
  int interpret() => _left.interpret() ~/ _right.interpret();
}
