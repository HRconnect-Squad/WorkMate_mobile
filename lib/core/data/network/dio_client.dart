import 'package:dio/dio.dart';
import '../../ services/logger_service.dart';
import '../../../features/auth/data/data_source/local/auth_local_data_source.dart';
import '../../config/app_config.dart';
import '../exception/app_exception.dart';
import 'constant/api_constant.dart';
import 'interceptor/auth_interceptor.dart';
import 'interceptor/error_interceptor.dart';
import 'interceptor/logging_interceptor.dart';

typedef ProgressCallback = void Function(int sent, int total);

enum HttpMethod { get, post, put, patch, delete }

class DioClient {
  final Dio _dio;
  final AuthLocalDataSource _localDataSource;

  DioClient(this._localDataSource) : _dio = Dio(
    BaseOptions(
      baseUrl: AppConfig.apiBaseUrl,
      connectTimeout: AppConfig.connectTimeout,
      receiveTimeout: AppConfig.receiveTimeout,
      sendTimeout: AppConfig.sendTimeout,
      headers: {
        ApiConstants.acceptanceHeaderKey: ApiConstants.acceptanceHeaderValue,
        ApiConstants.contentTypeHeaderKey: ApiConstants.contentTypeHeaderValue,
        ApiConstants.apiHeaderKey: AppConfig.xApiKey,
      },
    ),
  ) {
    _dio.interceptors.addAll([
      AuthInterceptor(_localDataSource),
      if (AppConfig.isDevelopment)
        LoggingInterceptor(),
      ErrorInterceptor()
    ]);
  }

  Future<Response> get(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    return _execute(
            () => _dio.get(
          path,
          queryParameters: queryParameters,
          options: options,
        ),
    );
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
      return _execute(() => _dio.post(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      ));
  }

  Future<Response> put(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    return _execute(() => _dio.put(
      path,
      data: data,
      queryParameters: queryParameters,
      options: options,
    ));
  }

  Future<Response> patch(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    return _execute(() => _dio.patch(
      path,
      data: data,
      queryParameters: queryParameters,
      options: options,
    ));
  }

  Future<Response> delete(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    return _execute(() => _dio.delete(
      path,
      data: data,
      queryParameters: queryParameters,
      options: options,
    ));
  }

  Future<Response> uploadFiles({
        required String path,
        required Map<String, MultipartFile> files,
        Map<String, dynamic>? extraFields,
        Map<String, dynamic>? queryParameters,
        CancelToken? cancelToken,
        ProgressCallback? onProgress,
        HttpMethod method = HttpMethod.post,
      }) async {
    if (files.isEmpty) {
      throw const ValidationException(
        message: 'At least one file is required',
      );
    }

    final formData = FormData.fromMap({
      ...files,
      if (extraFields != null) ...extraFields,
    });

    final options = Options(
      contentType: ApiConstants.multipartContentType,
    );

    return _execute((){
      switch (method) {
        case HttpMethod.post:
          return _dio.post(
            path,
            data: formData,
            queryParameters: queryParameters,
            cancelToken: cancelToken,
            options: options,
            onSendProgress: onProgress,
          );

        case HttpMethod.put:
          return _dio.put(
            path,
            data: formData,
            queryParameters: queryParameters,
            cancelToken: cancelToken,
            options: options,
            onSendProgress: onProgress,
          );

        case HttpMethod.patch:
          return _dio.patch(
            path,
            data: formData,
            queryParameters: queryParameters,
            cancelToken: cancelToken,
            options: options,
            onSendProgress: onProgress,
          );

        default:
          throw ValidationException(message: "Unsupported HTTP method: $method");
      }
    });
  }

  Future<T> _execute<T>(
      Future<T> Function() request,
      ) async {
    try {
      return await request();
    } on DioException catch (e) {
      if (e.error is AppException) {
        throw e.error as AppException;
      }
      logger.e(e.message, e.stackTrace);
      throw UnknownException(
        message: e.message ?? 'Unexpected network error',
      );
    }
  }
}