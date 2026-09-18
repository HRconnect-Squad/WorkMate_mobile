import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../data/cache/cache_manager.dart';
import '../data/cache/secure_storage_data_source.dart';
import '../data/cache/shared_preferences_service.dart';
import '../domain/service/cache_manager.dart';
import '../presentation/routes/config/app_startup_service.dart';

final sl = GetIt.instance;

Future<void> initCore() async {
  sl.registerLazySingleton<SecureStorageService>(
    () => SecureStorageServiceImpl(),
  );

  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerSingleton<SharedPreferences>(sharedPreferences);

  sl.registerLazySingleton<PreferencesService>(
    () => SharedPreferencesServiceImpl(sl<SharedPreferences>()),
  );

  sl.registerLazySingleton<CacheManager>(
        () => CacheManagerImpl(
      preferencesService: sl<PreferencesService>(),
      secureStorageService: sl<SecureStorageService>(),
    ),
  );

  sl.registerLazySingleton<AppStartupService>(
    () => AppStartupServiceImpl(sl<PreferencesService>(), sl<SecureStorageService>()),
  );

}