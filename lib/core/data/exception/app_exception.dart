sealed class AppException implements Exception {
  final String message;
  final String? code;
  final int? statusCode;
  final bool isUnauthorized;

  const AppException({
    required this.message,
    this.code,
    this.statusCode,
    this.isUnauthorized = false,
  });

  @override
  String toString() =>
      'AppException: $message (code: $code, status: $statusCode)';
}

class NetworkException extends AppException {
  const NetworkException({String message = 'No internet connection'})
    : super(message: message, code: 'NETWORK_ERROR');
}

class ConnectionTimeoutException extends AppException {
  const ConnectionTimeoutException({
    String message = 'Connection timed out. Please try again.',
  }) : super(message: message, code: 'TIMEOUT');
}

class ServerException extends AppException {
  const ServerException({required super.message, String? code, int? statusCode})
    : super(code: code, statusCode: statusCode);
}

class UnauthorizedException extends AppException {
  const UnauthorizedException({
    String message = 'Session expired. Please sign in again.',
    int? statusCode,
    String? code,
  }) : super(
         message: message,
         isUnauthorized: true,
         code: code,
         statusCode: statusCode,
       );
}

class CacheException extends AppException {
  const CacheException({
    required super.message,
    super.code = 'CACHE_ERROR',
    super.statusCode,
    super.isUnauthorized = false,
  });

  factory CacheException.read(String key, [Object? error]) {
    return CacheException(
      message: 'Failed to read $key${error != null ? ': $error' : ''}',
      code: 'CACHE_READ_ERROR',
    );
  }

  factory CacheException.write(String key, [Object? error]) {
    return CacheException(
      message: 'Failed to write $key${error != null ? ': $error' : ''}',
      code: 'CACHE_WRITE_ERROR',
    );
  }

  factory CacheException.delete(String key, [Object? error]) {
    return CacheException(
      message: 'Failed to delete $key${error != null ? ': $error' : ''}',
      code: 'CACHE_DELETE_ERROR',
    );
  }

  factory CacheException.invalidData(String key, String reason) {
    return CacheException(
      message: 'Invalid data for $key: $reason',
      code: 'CACHE_INVALID_DATA',
    );
  }
}

class ValidationException extends AppException {
  final Map<String, List<String>>? errors;

  const ValidationException({required super.message, this.errors})
    : super(code: 'VALIDATION_ERROR');

  String? getFieldError(String field) => errors?[field]?.firstOrNull;

  String get allErrors => errors?.values.expand((e) => e).join('\n') ?? message;
}

class UnknownException extends AppException {
  const UnknownException({String message = 'An unexpected error occurred'})
    : super(message: message, code: 'UNKNOWN_ERROR');
}
