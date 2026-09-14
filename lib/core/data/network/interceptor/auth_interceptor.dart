import 'package:dio/dio.dart';
import 'package:workmate/core/%20services/logger_service.dart';
import 'package:workmate/core/data/network/constant/api_constant.dart';
import 'package:workmate/features/auth/data/data_source/local/auth_local_data_source.dart';

class AuthInterceptor extends Interceptor {
  final AuthLocalDataSource _localDataSource;

  AuthInterceptor(this._localDataSource);

  @override
  void onRequest(
      RequestOptions options,
      RequestInterceptorHandler handler,
      ) async {
    if (options.extra['requiresAuth'] == false) {
      return handler.next(options);
    }

    try {
      final token = await _localDataSource.getToken();
      if (token != null && token.isNotEmpty) {
        options.headers[ApiConstants.authorizationHeaderKey] = '${ApiConstants.authorizationHeaderValue} $token';
      }
    } catch (_) {
      logger.e('Error getting token in AuthInterceptor');
      // Continue without token
    }
    handler.next(options);
  }
}