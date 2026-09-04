import '../network/dto/response/api_error_response.dart';

sealed class AppException implements Exception {
  final String message;
  final int? statusCode;
  final ApiErrorResponse? apiError;

  const AppException({required this.message, this.statusCode, this.apiError});

  @override
  String toString() =>
      'AppException($runtimeType): $message [code: $statusCode]';
}

class BadRequestException extends AppException {
  const BadRequestException({
    required super.message,
    super.statusCode = 400,
    super.apiError,
  });
}

class UnauthorizedException extends AppException {
  const UnauthorizedException({
    required super.message,
    super.statusCode = 401,
    super.apiError,
  });
}

class InvalidCredentialsException extends AppException {
  const InvalidCredentialsException({
    super.message = 'Invalid credentials',
    super.statusCode = 401,
    super.apiError});
}

class ForbiddenException extends AppException {
  const ForbiddenException({
    required super.message,
    super.statusCode = 403,
    super.apiError,
  });
}

class NotFoundException extends AppException {
  const NotFoundException({
    required super.message,
    super.statusCode = 404,
    super.apiError,
  });
}

class TooManyAttemptsException extends AppException {
  const TooManyAttemptsException({
    required super.message,
    super.statusCode = 429,
    super.apiError,
  });
}

class ServerException extends AppException {
  const ServerException({
    required super.message,
    super.statusCode = 500,
    super.apiError,
  });
}

class ConflictException extends AppException {
  const ConflictException({
    required super.message,
    super.statusCode = 409,
    super.apiError,
  });
}

class NetworkException extends AppException {
  const NetworkException({
    required super.message});
}

class TimeoutException extends AppException {
  const TimeoutException({
    required super.message});
}

class RequestCancelledException extends AppException {
  const RequestCancelledException({
    required super.message});
}

class CacheException extends AppException {
  const CacheException({required String message, int? code})
    : super(message: message, statusCode: code ?? 0);

  factory CacheException.read(String key, [Object? error]) => CacheException(
    message: 'Failed to read $key${error != null ? ': $error' : ''}',
  );

  factory CacheException.write(String key, [Object? error]) => CacheException(
    message: 'Failed to write $key${error != null ? ': $error' : ''}',
  );

  factory CacheException.delete(String key, [Object? error]) => CacheException(
    message: 'Failed to delete $key${error != null ? ': $error' : ''}',
  );

  factory CacheException.invalidData(String key, String reason) =>
      CacheException(message: 'Invalid data for $key: $reason');
}

class SerializationException extends AppException {
  const SerializationException({super.message = 'Failed to parse response'});
}

class FileException extends AppException {
  const FileException({required super.message});
}

class ValidationException extends AppException {
  const ValidationException({required super.message, super.statusCode, super.apiError});
}

class UnknownException extends AppException {
  const UnknownException({super.message = 'An unexpected error occurred'})
    : super(
        apiError: const ApiErrorResponse(
          success: false,
          message: 'An unexpected error occurred',
          errorCode: 'UNKNOWN_ERROR',
        ),
      );
}
