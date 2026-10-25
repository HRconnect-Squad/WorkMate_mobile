import '../../features/auth/domain/use_cases/get_current_user_id_use_case.dart';
import '../data/network/dio_client.dart';
import '../data/network/socket_client.dart';
import '../data/util/realtime_session_binder.dart';
import '../domain/service/session_state.dart';
import 'core_di_container.dart';

Future<void> initRealtime() async {
  sl.registerLazySingleton<SocketClient>(
        () => SocketClient(sl<DioClient>()),
    dispose: (client) => client.dispose(),
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