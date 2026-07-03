import 'package:workmate/core/domain/failure/domain_failure.dart';

class FailureUiMapper {
  const FailureUiMapper._();

  static String map(Failure failure) {
    return switch (failure) {
      NetworkFailure() =>
      'No internet connection. Please check your network and try again.',

      TimeoutFailure() =>
      'The request timed out. Please try again.',

      ServerFailure() =>
      'Something went wrong on our end. Please try again later.',

      UnauthorizedFailure() =>
      'Your session has expired. Please log in again.',

      ForbiddenFailure() =>
      'You don\'t have permission to perform this action.',

      NotFoundFailure() =>
      'The requested resource was not found.',

      CacheFailure() =>
      'Failed to load cached data.',

      TooManyAttemptsFailure() =>
      'Too many attempts. Please try again later.',

      ValidationFailure(:final errors) =>
      errors?.isNotEmpty == true ? errors!.combinedErrors : failure.message,

      BadRequestFailure() =>
      failure.message,

      UnknownFailure() =>
      'An unexpected error occurred. Please try again.',

      _ => failure.message,
    };
  }
}