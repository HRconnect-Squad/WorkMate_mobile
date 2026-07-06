import 'package:workmate/features/auth/data/data_source/local/onboarding_local_data_source%20.dart';
import '../../../../../core/data/cache/preferences_keys.dart';
import '../../../../../core/data/cache/shared_preferences_service.dart';
import '../../../../../core/data/exception/app_exception.dart';

class OnboardingLocalDataSourceImpl implements OnboardingLocalDataSource {
  final PreferencesService _preferencesService;

  OnboardingLocalDataSourceImpl(this._preferencesService);

  @override
  Future<void> saveOnboardingCompleted() async {
    try {
      await _preferencesService.setBool(
        key: PreferencesKeys.onboardingCompleted,
        value: true,
      );
    } catch (e) {
      throw CacheException.write(PreferencesKeys.onboardingCompleted, e);
    }
  }

  @override
  bool isOnboardingCompleted() {
    try {
      return _preferencesService.getBool(
            key: PreferencesKeys.onboardingCompleted,
          ) ??
          false;
    } catch (e) {
      throw CacheException.read(PreferencesKeys.onboardingCompleted, e);
    }
  }
}
