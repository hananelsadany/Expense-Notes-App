abstract class Failure {
  final String message;
  const Failure(this.message);
}

// Network failures
class NoInternetFailure extends Failure {
  const NoInternetFailure() : super('No internet connection');
}

class ServerFailure extends Failure {
  final int? statusCode;
  const ServerFailure(super.message, {this.statusCode});
}

class TimeoutFailure extends Failure {
  const TimeoutFailure() : super('Request timed out');
}

class UnauthorizedFailure extends Failure {
  const UnauthorizedFailure() : super('Unauthorized request');
}

// Database failures
class DbReadFailure extends Failure {
  const DbReadFailure(super.message);
}

class DbWriteFailure extends Failure {
  const DbWriteFailure(super.message);
}

class DbNotFoundException extends Failure {
  const DbNotFoundException(super.message);
}
