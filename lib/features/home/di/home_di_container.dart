import '../../../core/data/network/dio_client.dart';
import '../../../core/di/core_di_container.dart';
import '../../profile/domain/usecase/get_profile_usecase.dart';
import '../../task/domain/use_cases/get_tasks_by_due_date_use_case.dart';
import '../data/remote/home_remote_data_source.dart';
import '../data/remote/home_remote_data_source_impl.dart';
import '../data/repository_imp/home_repository_impl.dart';
import '../domain/repository/home_repository.dart';
import '../domain/usecase/get_today_meetings_usecase.dart';
import '../domain/usecase/get_unread_messages_count_usecase.dart';
import '../domain/usecase/get_unread_notifications_count_usecase.dart';
import '../presentation/logic/home_cubit.dart';

Future<void> initHome() async {
  sl.registerLazySingleton<HomeRemoteDataSource>(
    () => HomeRemoteDataSourceImpl(dioClient: sl<DioClient>()),
  );
  sl.registerLazySingleton<HomeRepository>(
    () => HomeRepositoryImpl(remote: sl<HomeRemoteDataSource>()),
  );

  sl.registerLazySingleton(() => GetUnreadMessagesCountUseCase(sl<HomeRepository>()));
  sl.registerLazySingleton(() => GetUnreadNotificationsCountUseCase(sl<HomeRepository>()));
  sl.registerLazySingleton(() => GetTodayMeetingsUseCase(sl<HomeRepository>()));

  sl.registerFactory(
    () => HomeCubit(
      getProfileUseCase: sl<GetProfileUseCase>(),
      getUnreadMessagesCountUseCase: sl<GetUnreadMessagesCountUseCase>(),
      getUnreadNotificationsCountUseCase: sl<GetUnreadNotificationsCountUseCase>(),
      getTodayMeetingsUseCase: sl<GetTodayMeetingsUseCase>(),
      getTasksByDueDateUseCase: sl<GetTasksByDueDateUseCase>(),
    ),
  );
}
