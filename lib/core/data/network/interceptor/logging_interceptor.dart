import 'package:dio/dio.dart';
import 'package:workmate/core/%20services/logger_service.dart';

class LoggingInterceptor extends Interceptor {
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