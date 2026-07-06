import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import '../../../features/auth/data/data_source/local/auth_local_data_source.dart';
import '../../config/app_config.dart';
import '../../config/logger_service.dart';
import '../exception/app_exception.dart';
import 'api_constants.dart';

typedef ProgressCallback = void Function(int sent, int total);

enum HttpMethod { get, post, put, patch, delete }

class DioClient {
  late final Dio _dio;
  final AuthLocalDataSource _localDataSource;

  DioClient(this._localDataSource) {
    _dio = Dio(
      BaseOptions(
        baseUrl: AppConfig.apiBaseUrl,
        connectTimeout: Duration(seconds: AppConfig.timeout),
        receiveTimeout: Duration(seconds: AppConfig.timeout),
        headers: {
          'Accept': ApiConstants.accept,
          'Content-Type': ApiConstants.contentType,
          ApiConstants.apiKeyHeader: AppConfig.xApiKey,
        },
      ),
    );

    _dio.interceptors.add(_AuthInterceptor(_localDataSource));

    if (kDebugMode) {
      _dio.interceptors.add(_LoggingInterceptor());
    }
  }

  Future<Response> get(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      return await _dio.get(
        path,
        queryParameters: queryParameters,
        options: options,
      );
    } on DioException catch (e) {
      throw _handleDioException(e);
    }
  }

  Future<Response> post(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      return await _dio.post(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
    } on DioException catch (e) {
      throw _handleDioException(e);
    }
  }

  Future<Response> put(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      return await _dio.put(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );
    } on DioException catch (e) {
      throw _handleDioException(e);
    }
  }

  Future<Response> patch(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      return await _dio.patch(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );
    } on DioException catch (e) {
      throw _handleDioException(e);
    }
  }

  Future<Response> delete(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      return await _dio.delete(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );
    } on DioException catch (e) {
      throw _handleDioException(e);
    }
  }

  Future<Response> uploadFiles(
    String path, {
    required Map<String, MultipartFile> files,
    Map<String, dynamic>? extraFields,
    Map<String, dynamic>? queryParameters,
    CancelToken? cancelToken,
    ProgressCallback? onProgress,
    HttpMethod method = HttpMethod.post,
  }) async {
    if (files.isEmpty) {
      throw const ValidationException(message: 'At least one file is required');
    }

    try {
      final formData = FormData.fromMap({
        ...files,
        if (extraFields != null) ...extraFields,
      });

      final options = Options(contentType: ApiConstants.multipartContentType);

      switch (method) {
        case HttpMethod.post:
          return await _dio.post(
            path,
            data: formData,
            queryParameters: queryParameters,
            cancelToken: cancelToken,
            options: options,
            onSendProgress: onProgress != null
                ? (sent, total) => onProgress(sent, total)
                : null,
          );
        case HttpMethod.put:
          return await _dio.put(
            path,
            data: formData,
            queryParameters: queryParameters,
            cancelToken: cancelToken,
            options: options,
            onSendProgress: onProgress != null
                ? (sent, total) => onProgress(sent, total)
                : null,
          );
        case HttpMethod.patch:
          return await _dio.patch(
            path,
            data: formData,
            queryParameters: queryParameters,
            cancelToken: cancelToken,
            options: options,
            onSendProgress: onProgress != null
                ? (sent, total) => onProgress(sent, total)
                : null,
          );
        default:
          throw ValidationException(
            message: 'Unsupported HTTP method: $method',
          );
      }
    } on DioException catch (e) {
      throw _handleDioException(e);
    }
  }

  AppException _handleDioException(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return const ConnectionTimeoutException();

      case DioExceptionType.connectionError:
        return const NetworkException();

      case DioExceptionType.badResponse:
        return _parseErrorResponse(e.response);

      case DioExceptionType.cancel:
        return const ServerException(message: 'Request was cancelled');

      case DioExceptionType.badCertificate:
        return const ServerException(message: 'Invalid security certificate');

      default:
        if (e.error != null && e.error.toString().contains('SocketException')) {
          return const NetworkException();
        }
        return const UnknownException();
    }
  }

  AppException _parseErrorResponse(Response? response) {
    final statusCode = response?.statusCode;
    final data = response?.data;
    String message = 'An error occurred';
    String? errorCode;
    Map<String, List<String>>? validationErrors;

    if (data is Map<String, dynamic>) {
      message = data['message'] as String? ?? message;
      errorCode = data['error_code'] as String?;

      final errors = data['errors'];
      if (errors is Map<String, dynamic>) {
        validationErrors = errors.map(
          (key, value) => MapEntry(
            key,
            value is List
                ? value.map((e) => e.toString()).toList()
                : [value.toString()],
          ),
        );
      }
    }

    switch (statusCode) {
      case 400:
        return ServerException(
          message: message,
          code: errorCode ?? 'BAD_REQUEST',
          statusCode: 400,
        );

      case 401:
        if (_isInvalidCredentials(errorCode, message)) {
          return ServerException(
            message: message,
            code: errorCode ?? 'INVALID_CREDENTIALS',
            statusCode: 401,
          );
        }
        return UnauthorizedException(
          message: message,
          code: errorCode ?? 'UNAUTHENTICATED',
          statusCode: 401,
        );

      case 403:
        return ServerException(
          message: message,
          code: errorCode ?? 'FORBIDDEN',
          statusCode: 403,
        );

      case 404:
        return ServerException(
          message: message,
          code: errorCode ?? 'NOT_FOUND',
          statusCode: 404,
        );

      case 422:
        return ValidationException(message: message, errors: validationErrors);

      case 429:
        return ServerException(
          message: message,
          code: errorCode ?? 'TOO_MANY_REQUESTS',
          statusCode: 429,
        );

      case 500:
      case 502:
      case 503:
      case 504:
        return ServerException(
          message: message,
          code: errorCode ?? 'SERVER_ERROR',
          statusCode: statusCode,
        );

      default:
        return ServerException(
          message: message,
          code: errorCode,
          statusCode: statusCode,
        );
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

//   AppException _handleBadResponse(int? statusCode) {
//     switch (statusCode) {
//       case 400:
//         return const ServerException(
//           message: 'Bad request',
//           code: 'BAD_REQUEST',
//           statusCode: 400,
//         );
//
//       case 401:
//         return const ServerException(
//           message: 'Unauthorized',
//           code: 'UNAUTHORIZED',
//           statusCode: 401,
//         );
//
//       case 403:
//         return const ServerException(
//           message: 'Access forbidden',
//           code: 'FORBIDDEN',
//           statusCode: 403,
//         );
//
//       case 404:
//         return const ServerException(
//           message: 'Resource not found',
//           code: 'NOT_FOUND',
//           statusCode: 404,
//         );
//
//       case 422:
//         return const ServerException(
//           message: 'Validation error',
//           code: 'VALIDATION_ERROR',
//           statusCode: 422,
//         );
//
//       case 429:
//         return const ServerException(
//           message: 'Too many requests. Please try again later.',
//           code: 'TOO_MANY_REQUESTS',
//           statusCode: 429,
//         );
//
//       case 500:
//       case 502:
//       case 503:
//       case 504:
//         return const ServerException(
//           message: 'Server error. Please try again later.',
//           code: 'SERVER_ERROR',
//           statusCode: 500,
//         );
//
//       default:
//         return ServerException(
//           message: 'Error: ${statusCode ?? 'unknown'}',
//           statusCode: statusCode,
//         );
//     }
//   }
// }

class _AuthInterceptor extends Interceptor {
  final AuthLocalDataSource _localDataSource;

  _AuthInterceptor(this._localDataSource);

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    try {
      final token = await _localDataSource.getToken();
      if (token != null && token.isNotEmpty) {
        options.headers[ApiConstants.authorizationHeader] = 'Bearer $token';
      }
    } catch (_) {
      // Continue without token
    }
    handler.next(options);
  }
}

class _LoggingInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    logger.logRequest(
      method: options.method,
      path: options.path,
      data: options.data,
    );
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    logger.logResponse(
      statusCode: response.statusCode,
      path: response.requestOptions.path,
      data: response.data,
    );
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    logger.logError(
      statusCode: err.response?.statusCode,
      path: err.requestOptions.path,
      error: err.message,
      responseData: err.response?.data,
    );
    handler.next(err);
  }
}
