import 'package:workmate/core/domain/failure/validation_error.dart';

//Marker
abstract interface class RequiresReauthentication {}

abstract class Failure {
  final String message;
  final int? statusCode;
  final String? errorCode;

  const Failure({required this.message, this.statusCode, this.errorCode});

  // @override
  // bool operator ==(Object other) =>
  //     identical(this, other) ||
  //         other is Failure &&
  //             runtimeType == other.runtimeType &&
  //             message == other.message;
  //
  // @override
  // int get hashCode => message.hashCode;

  @override
  String toString() => '$runtimeType: $message';
}

class NetworkFailure extends Failure {
  const NetworkFailure({super.message = 'No internet connection'});
}

class TimeoutFailure extends Failure {
  const TimeoutFailure(
      {super.message = 'Connection timed out. Please try again'});
}

class ConflictFailure extends Failure {
  const ConflictFailure({super.message = 'This resource already exists'});
}

class CacheFailure extends Failure {
  const CacheFailure({super.message = 'Failed to access local data'});
}

class UnknownFailure extends Failure {
  const UnknownFailure({super.message = 'An unexpected error occurred'});
}

class ServerFailure extends Failure {
  const ServerFailure({required super.message, super.statusCode, super.errorCode});
}

class BadRequestFailure extends Failure {
  const BadRequestFailure({super.message = 'Bad request'});
}

class UnauthorizedFailure extends Failure implements RequiresReauthentication {
  const UnauthorizedFailure({super.message = 'Unauthorized'});
}

class ForbiddenFailure extends Failure {
  const ForbiddenFailure({super.message = 'Forbidden'});
}

class TooManyAttemptsFailure extends Failure {
  const TooManyAttemptsFailure({super.message = 'Too many attempts'});
}


class NotFoundFailure extends Failure {
  const NotFoundFailure({super.message = 'Resource not found'});
}

class FileFailure extends Failure {
  const FileFailure({super.message = 'File operation failed'});
}

class ValidationFailure extends Failure {
  final ValidationErrors? errors;
  const ValidationFailure({super.message = 'Please check your input', this.errors});
}