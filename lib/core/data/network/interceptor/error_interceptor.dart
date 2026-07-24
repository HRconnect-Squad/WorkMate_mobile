import 'package:dio/dio.dart';
import 'package:workmate/core/%20services/logger_service.dart';
import '../../exception/app_exception.dart';
import '../dto/response/api_error_response.dart';

class ErrorInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final appException = _mapDioException(err);

    handler.reject(
      DioException(
        requestOptions: err.requestOptions,
        response: err.response,
        type: err.type,
        error: appException,
        message: err.message,
      ),
    );
  }

  AppException _mapDioException(DioException err) {
    switch (err.type) {
      case DioExceptionType.connectionTimeout ||
          DioExceptionType.sendTimeout ||
          DioExceptionType.receiveTimeout:
        {
          logger.e(err.message);
          return const TimeoutException(message: 'Connection timed out');
        }
      case DioExceptionType.badCertificate:
        {
          logger.e(err.message);
          return const ServerException(message: 'Invalid security certificate');
        }
      case DioExceptionType.badResponse:
        {
          logger.e(err.message);
          return _mapResponseException(err.response);
        }
      case DioExceptionType.cancel:
        {
          logger.e(err.message);
          return const ServerException(message: 'Request was cancelled');
        }
      case DioExceptionType.connectionError:
        {
          logger.e(err.message);
          return const NetworkException(message: 'No internet connection');
        }
      default:
        {
          logger.e(err.message);
          return err.error != null &&
                  err.error.toString().contains('SocketException')
              ? const NetworkException(
                  message: 'No internet connection or server is down',
                )
              : const UnknownException(message: 'An unexpected error occurred');
        }
    }
  }

  AppException _mapResponseException(Response? response) {
    final statusCode = response?.statusCode;
    final apiError = _parseApiError(response);
    final message =
        apiError?.message ??
        response?.statusMessage ??
        'An error occurred without a message';

    return switch (statusCode) {
      400 => BadRequestException(
        message: message,
        statusCode: statusCode,
        apiError: apiError,
      ),
      401 =>
        _isInvalidCredentials(apiError?.errorCode, message)
            ? InvalidCredentialsException(
                message: message,
                statusCode: statusCode,
                apiError: apiError,
              )
            : UnauthorizedException(
                message: message,
                statusCode: statusCode,
                apiError: apiError,
              ),
      403 => ForbiddenException(
        message: message,
        statusCode: statusCode,
        apiError: apiError,
      ),
      404 => NotFoundException(
        message: message,
        statusCode: statusCode,
        apiError: apiError,
      ),
      422 => ValidationException(
        message: message,
        statusCode: statusCode,
        apiError: apiError,
      ),
      429 => TooManyAttemptsException(
        message: message,
        statusCode: statusCode,
        apiError: apiError,
      ),
      500 => ServerException(
        message: message,
        statusCode: statusCode,
        apiError: apiError,
      ),
      _ => ServerException(
        message: message,
        statusCode: statusCode,
        apiError: apiError,
      ),
    };
  }

  ApiErrorResponse? _parseApiError(Response? response) {
    final data = response?.data;

    if (data is! Map<String, dynamic>) {
      return null;
    }
    try {
      return ApiErrorResponse.fromJson(data);
    } catch (e, stackTrace) {
      logger.e('Failed to parse API error response', error: e, stackTrace: stackTrace);
      return null;
    }
  }

  bool _isInvalidCredentials(String? errorCode, String message) {
    final code = errorCode?.toUpperCase() ?? '';
    final msg = message.toLowerCase();

    if (code == 'INVALID_CREDENTIALS') return true;

    return msg.contains('invalid') ||
        msg.contains('incorrect') ||
        msg.contains('wrong password') ||
        msg.contains('credentials');
  }
}
