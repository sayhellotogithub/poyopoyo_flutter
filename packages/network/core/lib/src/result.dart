// -------------------------------------------------------------------
// Author: WANG JUN
// Date: 2025/08/12
// Description: 
// -------------------------------------------------------------------
sealed class Result<T, E extends Object> {
  const Result();

  R fold<R>(R Function(T data) onSuccess, R Function(E e) onFailure);

  // 常用变换
  Result<R, E> map<R>(R Function(T) f) =>
      switch (this) { Ok(:final value) => Ok<R, E>(f(value)), Err(:final error) => Err<R, E>(error) };

  Result<T, F> mapError<F extends Object>(F Function(E) f) =>
      switch (this) { Ok(:final value) => Ok<T, F>(value), Err(:final error) => Err<T, F>(f(error)) };

  bool get isOk => switch (this) { Ok() => true, Err() => false };
  bool get isErr => !isOk;

  T? get okOrNull => switch (this) { Ok(:final value) => value, _ => null };
  E? get errOrNull => switch (this) { Err(:final error) => error, _ => null };

  T getOrElse(T Function(E) orElse) =>
      fold((v) => v, (e) => orElse(e));
}
final class Ok<T, E extends Object> extends Result<T, E> {
  const Ok(this.value);
  final T value;

  @override
  R fold<R>(R Function(T data) onSuccess, R Function(E e) onFailure) => onSuccess(value);
}

final class Err<T, E extends Object> extends Result<T, E> {
  const Err(this.error);
  final E error;

  @override
  R fold<R>(R Function(T data) onSuccess, R Function(E e) onFailure) => onFailure(error);
}