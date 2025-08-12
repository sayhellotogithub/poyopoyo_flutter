// -------------------------------------------------------------------
// Author: WANG JUN
// Date: 2025/08/12
// Description:
// -------------------------------------------------------------------
sealed class Result<T,E extends Object> {
  const Result();

  R fold<R>(R Function(T data) onSuccess, R Function(E e) onFailure);
}

class Success<T,E extends Object> extends Result<T,E> {
  final T data;

  const Success(this.data);

  @override
  R fold<R>(R Function(T) onSuccess, R Function(E e) onFailure) =>
      onSuccess(data);
}

class Failure<T,E extends Object> extends Result<T,E> {
  final E error;

  const Failure(this.error);

  @override
  R fold<R>(R Function(T) onSuccess, R Function(E e) onFailure) =>
      onFailure(error);
}

class AppFailure {
  final AppFailureType type;
  final String message;
  final int? httpStatus;
  final String? bizCode;
  final Object? cause;

  const AppFailure({
    required this.type,
    required this.message,
    this.httpStatus,
    this.bizCode,
    this.cause,
  });
}

enum AppFailureType {
  noInternet,
  timeout,
  cancel,
  http,
  business,
  serialization,
  unknown,
}
