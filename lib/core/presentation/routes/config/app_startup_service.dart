import '../../../data/cache/preferences_keys.dart';
import '../../../data/cache/secure_storage_data_source.dart';
import '../../../data/cache/shared_preferences_service.dart';
import '../../../data/network/constant/api_constant.dart';
import 'app_state_notifier.dart';

abstract class AppStartupService {
  bool isOnboardingCompleted();
  Future<bool> isLoggedIn();
  Future<void> initialize();
}

class AppStartupServiceImpl implements AppStartupService {
  final PreferencesService _prefs;
  final SecureStorageService _secureStorage;

  AppStartupServiceImpl(this._prefs, this._secureStorage);

  @override
  bool isOnboardingCompleted() {
    return _prefs.getBool(key: PreferencesKeys.onboardingCompleted) ?? false;
  }

  @override
  Future<bool> isLoggedIn() async {
    final token = await _secureStorage.read(key: ApiConstants.localDataTokenKey);
    return token != null && token.isNotEmpty;
  }

  @override
  Future<void> initialize() async {
    await AuthStateNotifier.instance.initialize(
      checkIsLoggedIn: isLoggedIn,
      checkOnboardingCompleted: isOnboardingCompleted,
    );
  }
}