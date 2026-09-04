import 'package:flutter_dotenv/flutter_dotenv.dart';

enum AppEnvironment { development, production }

class AppConfig {
  AppConfig._();

  static bool _isInitialized = false;

  static Future<void> init() async {
    if (_isInitialized) return;

    await dotenv.load(fileName: '.env');
    _isInitialized = true;
  }

  static AppEnvironment get environment {
    _ensureInitialized();

    final env = dotenv.get('ENV', fallback: AppEnvironment.development.name);

    return AppEnvironment.values.firstWhere(
      (e) => e.name == env,
      orElse: () => AppEnvironment.development,
    );
  }

  static bool get isProduction => environment == AppEnvironment.production;
  static bool get isDevelopment => environment == AppEnvironment.development;


  static String get apiBaseUrl {
    _ensureInitialized();
    return _getString('API_BASE_URL', 'https://api.mohammedzom.online');
  }

  static String get xApiKey {
    _ensureInitialized();
    return _getString('X_API_KEY', 'WorkMate');
  }

  static String get appName {
    _ensureInitialized();
    return _getString('APP_NAME', 'WorkMate');
  }

  static Duration get connectTimeout {
    _ensureInitialized();
    return Duration(milliseconds: _getInt('CONNECT_TIMEOUT', 30000));
  }

  static Duration get receiveTimeout {
    _ensureInitialized();
    return Duration(milliseconds: _getInt('RECEIVE_TIMEOUT', 30000));
  }

  static Duration get sendTimeout {
    _ensureInitialized();
    return Duration(milliseconds: _getInt('SEND_TIMEOUT', 30000));
  }

  static int _getInt(String key, int fallback) {
    final value = dotenv.maybeGet(key);
    if (value == null) return fallback;
    return int.tryParse(value) ?? fallback;
  }

  static String _getString(String key, String fallback) {
    final value = dotenv.maybeGet(key);
    if (value == null) return fallback;
    return value;
  }

  static void _ensureInitialized() {
    if (!_isInitialized) {
      throw StateError(
        'AppConfig is not initialized. '
            'Call AppConfig.init() before accessing configuration values.',
      );
    }
  }
}
