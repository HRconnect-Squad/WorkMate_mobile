abstract class SettingsLocalDataSource {
  Future<void> saveThemeMode(String themeMode);
  Future<String?> getThemeMode();
  Future<void> saveLanguage(String languageCode);
  Future<String?> getLanguage();
  Future<void> setOnboardingCompleted(bool isCompleted);
  Future<bool> isOnboardingCompleted();
  Future<void> saveIsLoggedIn(bool isLoggedIn);
  Future<bool> getIsLoggedIn();
}