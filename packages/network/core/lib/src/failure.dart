// -------------------------------------------------------------------
// Author: WANG JUN
// Date: 2025/08/12
// Description:
// -------------------------------------------------------------------
sealed class NetFailure {
  const NetFailure();
}

class NetTimeout extends NetFailure {
  const NetTimeout();
}

class NetCanceled extends NetFailure {
  const NetCanceled();
}

class NetNoConnection extends NetFailure {
  const NetNoConnection();
}

class NetTls extends NetFailure {
  const NetTls();
}

class NetDns extends NetFailure {
  const NetDns();
}

class NetUnauthorized extends NetFailure {
  const NetUnauthorized();
}

class NetHttpError extends NetFailure {
  final int status;
  final String? message;

  const NetHttpError(this.status, {this.message});
}

class NetUnknown extends NetFailure {
  final Object error;

  const NetUnknown(this.error);
}
