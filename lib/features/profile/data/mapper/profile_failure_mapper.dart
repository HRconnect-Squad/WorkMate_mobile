import '../../../../core/data/exception/app_exception.dart';
import '../../../../core/domain/failure/domain_failure.dart';
import '../../domain/failure/failure.dart';

abstract final class ProfileFailureMapper {
  const ProfileFailureMapper._();

  static Failure? fromException(AppException exception) {
    final code = exception.apiError?.errorCode?.toUpperCase();

    if (code != null) {
      final byCode = _fromErrorCode(code, exception.message);
      if (byCode != null) return byCode;
    }

    if (exception is ValidationException) {
      return ValidationFailure(
        message: exception.message,
        errors: exception.apiError?.validationErrors,
      );
    }

    return null;
  }

  static Failure? _fromErrorCode(String code, String message) {
    return switch (code) {
      'PROFILE_NOT_COMPLETED'       => ProfileNotCompletedFailure(message: message),
      'PROFILE_ALREADY_EXISTS'      => ProfileAlreadyExistsFailure(message: message),
      'PROFILE_IMAGE_UPLOAD_FAILED' => ProfileImageUploadFailure(message: message),
      _                              => null,
    };
  }
}