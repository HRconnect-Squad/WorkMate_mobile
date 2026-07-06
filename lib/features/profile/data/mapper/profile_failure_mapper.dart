import '../../../../core/data/exception/app_exception.dart';
import '../../../../core/domain/failure/domain_failure.dart';
import '../../../auth/domain/failures/failure.dart';
import '../../domain/failure/failure.dart';

class ProfileFailureMapper {
  const ProfileFailureMapper._();

  static Failure mapException(Object exception) {
    if (exception is ServerException) {
      return _mapServerException(exception);
    }

    if (exception is NetworkException) {
      return const NetworkFailure();
    }

    if (exception is ConnectionTimeoutException) {
      return const TimeoutFailure();
    }

    if (exception is CacheException) {
      return CacheFailure(exception.message);
    }

    if (exception is UnauthorizedException) {
      return const SessionExpiredFailure();
    }

    if (exception is ValidationException) {
      return ValidationFailure(
        message: exception.message,
        fieldErrors: exception.errors,
      );
    }

    if (exception is AppException) {
      return UnknownFailure(exception.message);
    }

    return UnknownFailure(exception.toString());
  }

  static Failure _mapServerException(ServerException exception) {
    final code = exception.code?.toUpperCase();
    final message = exception.message;

    switch (code) {
      case 'PROFILE_NOT_COMPLETED':
        return ProfileNotCompletedFailure(message);
      case 'PROFILE_NOT_FOUND':
        return ProfileFetchFailure(message);
      case 'PROFILE_UPDATE_FAILED':
        return ProfileUpdateFailure(message);
      case 'PROFILE_IMAGE_UPLOAD_FAILED':
        return ProfileImageUploadFailure(message);
      case 'PROFILE_ALREADY_EXISTS':
        return ProfileAlreadyExistsFailure(message);
    }

    switch (exception.statusCode) {
      case 404:
        return ProfileFetchFailure(message);
      case 409:
        return ProfileAlreadyExistsFailure(message);
      case 422:
        return ProfileUpdateFailure(message);
      default:
        return ServerFailure(message);
    }
  }
}