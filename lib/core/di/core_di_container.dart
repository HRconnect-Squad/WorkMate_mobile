import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:workmate/core/data/util/realtime_session_binder.dart';
import '../../features/auth/domain/use_cases/get_current_user_id_use_case.dart';
import '../data/cache/cache_manager.dart';
import '../data/cache/secure_storage_data_source.dart';
import '../data/cache/shared_preferences_service.dart';
import '../data/network/dio_client.dart';
import '../data/network/socket_client.dart';
import '../domain/service/cache_manager.dart';
import '../domain/service/session_state.dart';
import '../presentation/routes/config/app_startup_service.dart';
import '../presentation/routes/config/auth_state_notifer.dart';

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

  sl.registerLazySingleton<SocketClient>(
        () => SocketClient(sl<DioClient>()),
    dispose: (client) => client.dispose(),
  );

  sl.registerSingleton<SessionState>(
    AuthStateNotifier.instance,
  );

  sl.registerLazySingleton<RealtimeSessionBinder>(
        () => RealtimeSessionBinder(
      socket: sl<SocketClient>(),
      session: sl<SessionState>(),
      getUserId: sl<GetCurrentUserIdUseCase>().call,
    ),
    dispose: (binder) => binder.dispose(),
  );

}