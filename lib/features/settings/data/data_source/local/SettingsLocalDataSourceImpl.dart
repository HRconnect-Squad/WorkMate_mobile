import '../../../../../core/data/cache/shared_preferences_service.dart';
import '../../../utils/shared_prefs_keys.dart';
import 'SettingsLocalDataSource.dart';

class SettingsLocalDataSourceImpl implements SettingsLocalDataSource {
  final PreferencesService _preferences;

  SettingsLocalDataSourceImpl(this._preferences);

  @override
  Future<void> saveLanguage(String languageCode) async {
    await _preferences.setString(key: SharedPreferencesKeys.languageKey, value: languageCode);
  }

  @override
  Future<String?> getLanguage() async {
    return await _preferences.getString(key: SharedPreferencesKeys.languageKey);
  }

  @override
  Future<void> saveThemeMode(String themeMode) async {
    await _preferences.setString(key: SharedPreferencesKeys.themeModeKey, value: themeMode);
  }

  @override
  Future<String?> getThemeMode() async {
    return await _preferences.getString(key: SharedPreferencesKeys.themeModeKey);
  }

  @override
  Future<bool> isOnboardingCompleted() async {
    return await _preferences.getBool(key: SharedPreferencesKeys.onboardingCompletedKey) ?? false;
  }

  @override
  Future<void> setOnboardingCompleted(bool isCompleted) async {
    await _preferences.setBool(key: SharedPreferencesKeys.onboardingCompletedKey, value: isCompleted);
  }

  @override
  Future<bool> getIsLoggedIn() async {
    return await _preferences.getBool(key: SharedPreferencesKeys.isLoggedInKey) ?? false;
  }

  @override
  Future<void> saveIsLoggedIn(bool isLoggedIn) async {
    await _preferences.setBool(key: SharedPreferencesKeys.isLoggedInKey, value: isLoggedIn);
  }

}