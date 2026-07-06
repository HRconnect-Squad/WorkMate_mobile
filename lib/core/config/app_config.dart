import 'package:flutter_dotenv/flutter_dotenv.dart';

enum AppEnvironment { development, staging, production }

class AppConfig {
  AppConfig._();

  static bool _isInitialized = false;

  static Future<void> init() async {
    if (_isInitialized) return;

    await dotenv.load(fileName: '.env');
    _isInitialized = true;
  }

  static void _ensureInitialized() {
    if (!_isInitialized) {
      throw StateError(
        'AppConfig is not initialized. '
        'Call AppConfig.init() before accessing configuration values.',
      );
    }
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

  static bool get isStaging => environment == AppEnvironment.staging;

  static String get apiBaseUrl {
    _ensureInitialized();
    return dotenv.get('API_BASE_URL', fallback: 'https://localhost:8080');
  }

  static String get xApiKey {
    _ensureInitialized();
    return dotenv.get('X_API_KEY', fallback: '');
  }

  static String get appName {
    _ensureInitialized();
    return dotenv.get('APP_NAME', fallback: 'HR App');
  }

  static int get timeout {
    _ensureInitialized();
    final value = dotenv.get('TIMEOUT_SECONDS', fallback: '10');
    return int.tryParse(value) ?? 10;
  }
}
