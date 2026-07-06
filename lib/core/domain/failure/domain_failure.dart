abstract class Failure {
  final String message;

  const Failure(this.message);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is Failure &&
              runtimeType == other.runtimeType &&
              message == other.message;

  @override
  int get hashCode => message.hashCode;

  @override
  String toString() => '$runtimeType: $message';
}

class NetworkFailure extends Failure {
  const NetworkFailure([super.message = 'No internet connection']);
}

class TimeoutFailure extends Failure {
  const TimeoutFailure([
    super.message = 'Connection timed out. Please try again',
  ]);
}

class ServerFailure extends Failure {
  const ServerFailure([super.message = 'Server error. Please try again later']);
}

class CacheFailure extends Failure {
  const CacheFailure([super.message = 'Failed to access local data']);
}

class UnknownFailure extends Failure {
  const UnknownFailure([super.message = 'An unexpected error occurred']);
}