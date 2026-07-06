import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

class LoggerService {
  static final LoggerService _instance = LoggerService._internal();

  factory LoggerService() => _instance;

  late final Logger _logger;

  LoggerService._internal() {
    _logger = Logger(
      printer: PrettyPrinter(
        methodCount: 0,
        errorMethodCount: 5,
        lineLength: 80,
        colors: true,
        printEmojis: true,
        dateTimeFormat: DateTimeFormat.onlyTimeAndSinceStart,
      ),
      level: kDebugMode ? Level.debug : Level.off,
    );
  }

  void d(dynamic message) => _logger.d(message);

  void i(dynamic message) => _logger.i(message);

  void w(dynamic message) => _logger.w(message);

  void e(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _logger.e(message, error: error, stackTrace: stackTrace);
  }

  void logRequest({
    required String method,
    required String path,
    dynamic data,
    Map<String, dynamic>? headers,
  }) {
    final sanitizedData = _sanitizeData(data);
    final sanitizedHeaders = headers != null ? _sanitizeData(headers) : null;

    _logger.i(
      '🚀 REQUEST\n'
      '├── Method: $method\n'
      '├── Path: $path\n'
      '${sanitizedHeaders != null ? '├── Headers: $sanitizedHeaders\n' : ''}'
      '└── Data: $sanitizedData',
    );
  }

  void logResponse({
    required int? statusCode,
    required String path,
    dynamic data,
  }) {
    final sanitizedData = _sanitizeData(data);
    final truncatedData = _truncateString(sanitizedData.toString());

    _logger.i(
      '✅ RESPONSE\n'
      '├── Status: $statusCode\n'
      '├── Path: $path\n'
      '└── Data: $truncatedData',
    );
  }

  void logError({
    required int? statusCode,
    required String path,
    dynamic error,
    dynamic responseData,
  }) {
    final sanitizedResponse = responseData != null
        ? _sanitizeData(responseData)
        : null;

    _logger.e(
      '❌ ERROR\n'
      '├── Status: $statusCode\n'
      '├── Path: $path\n'
      '├── Error: $error\n'
      '${sanitizedResponse != null ? '└── Response: $sanitizedResponse' : ''}',
    );
  }

  static const _sensitiveKeys = <String>{
    'password',
    'password_confirmation',
    'confirm_password',
    'new_password',
    'old_password',
    'current_password',
    'token',
    'access_token',
    'refresh_token',
    'bearer',
    'authorization',
    'api_key',
    'apikey',
    'x-api-key',
    'secret',
    'secret_key',
    'private_key',
    //'otp',
    'code',
    'pin',
    'cvv',
    'card_number',
    'credit_card',
    'ssn',
    'social_security',
  };

  static const _hiddenPlaceholder = '******';

  dynamic _sanitizeData(dynamic data) {
    if (data == null) return null;

    if (data is Map) {
      return _sanitizeMap(data);
    }

    if (data is List) {
      return data.map((item) => _sanitizeData(item)).toList();
    }

    if (data is FormData) {
      return _sanitizeFormData(data);
    }

    if (data is String) {
      return _sanitizeString(data);
    }

    return data;
  }

  Map<String, dynamic> _sanitizeMap(Map data) {
    final sanitized = <String, dynamic>{};

    data.forEach((key, value) {
      final keyString = key.toString().toLowerCase();

      if (_isSensitiveKey(keyString)) {
        sanitized[key.toString()] = _hiddenPlaceholder;
      } else {
        sanitized[key.toString()] = _sanitizeData(value);
      }
    });

    return sanitized;
  }

  bool _isSensitiveKey(String key) {
    final lowerKey = key.toLowerCase();
    return _sensitiveKeys.any((sensitive) => lowerKey.contains(sensitive));
  }

  String _sanitizeFormData(FormData formData) {
    final fields = <String>[];

    for (final field in formData.fields) {
      final key = field.key;
      final value = _isSensitiveKey(key.toLowerCase())
          ? _hiddenPlaceholder
          : field.value;
      fields.add('$key: $value');
    }

    for (final file in formData.files) {
      fields.add('${file.key}: [FILE: ${file.value.filename}]');
    }

    return 'FormData { ${fields.join(', ')} }';
  }

  String _sanitizeString(String value) {
    // If it looks like a JWT or long token, partially hide it
    if (_looksLikeToken(value)) {
      return _partiallyHideToken(value);
    }
    return value;
  }

  bool _looksLikeToken(String value) {
    // JWT pattern: xxxxx.xxxxx.xxxxx
    if (RegExp(
      r'^[A-Za-z0-9-_]+\.[A-Za-z0-9-_]+\.[A-Za-z0-9-_]+$',
    ).hasMatch(value)) {
      return true;
    }

    if (value.length > 40 && RegExp(r'^[A-Za-z0-9-_|]+$').hasMatch(value)) {
      return true;
    }

    return false;
  }

  String _partiallyHideToken(String token) {
    if (token.length <= 10) return _hiddenPlaceholder;

    final visibleStart = token.substring(0, 6);
    final visibleEnd = token.substring(token.length - 4);
    return '$visibleStart...$visibleEnd';
  }

  String _truncateString(String data, {int maxLength = 500}) {
    if (data.length > maxLength) {
      return '${data.substring(0, maxLength)}... [TRUNCATED]';
    }
    return data;
  }
}

final logger = LoggerService();
