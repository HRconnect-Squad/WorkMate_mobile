import '../../../core/data/cache/shared_preferences_service.dart';
import '../../../core/data/network/dio_client.dart';
import '../../../core/di/core_di_container.dart';
import '../data/data_source/local/attendance_local_data_source_impl.dart';
import '../data/data_source/local/ttendance_local_data_source.dart';
import '../data/data_source/remote/LocationRemoteDataSource.dart';
import '../data/data_source/remote/LocationRemoteDataSourceImpl.dart';
import '../data/data_source/remote/attendance_remote_data_source.dart';
import '../data/data_source/remote/attendance_remote_data_source_impl.dart';
import '../data/repository_imp/LocationRepositoryImpl.dart';
import '../data/repository_imp/attendance_repository_impl.dart';
import '../domain/repository/AttendanceRepository.dart';
import '../domain/repository/LocationRepository.dart';
import '../domain/use_case/EndAttendanceBreakUseCase.dart';
import '../domain/use_case/GetCurrentLocationUseCase.dart';
import '../domain/use_case/StartAttendanceBreakUseCase.dart';
import '../domain/use_case/attendance_history_use_case.dart';
import '../domain/use_case/clock_in_attendance_use_case.dart';
import '../domain/use_case/clock_out_attendance_use_case.dart';
import '../domain/use_case/getUserInfoUseCase.dart';
import '../domain/use_case/get_attendance_today_use_case.dart';
import '../domain/use_case/get_attendance_details_by_id_use_case.dart';
import '../presentation/attendance_notifier/attendance_notifier.dart';
import '../presentation/attendance/logic/attendance_screen_cubit.dart';
import '../presentation/clock_in/logic/ClockInFlowCubit.dart';
import '../presentation/details_history_card/logic/details_history_card_cubit.dart';

Future<void> initAttendance() async {
  // 1. Data Sources
  sl.registerLazySingleton<AttendanceRemoteDataSource>(
        () => AttendanceRemoteDataSourceImpl(dioClient: sl<DioClient>()),
  );
  sl.registerLazySingleton<LocationRemoteDataSource>(
        () => LocationRemoteDataSourceImpl(),
  );
  sl.registerLazySingleton<AttendanceLocalDataSource>(
        () => AttendanceLocalDataSourceImpl(
      preferencesService: sl<PreferencesService>(),
    ),
  );

  // 2. Repositories
  sl.registerLazySingleton<AttendanceRepository>(
        () => AttendanceRepositoryImpl(
      attendanceRemoteDataSource: sl<AttendanceRemoteDataSource>(),
      attendanceLocalDataSource: sl<AttendanceLocalDataSource>(),
    ),
  );
  sl.registerLazySingleton<LocationRepository>(
        () => LocationRepositoryImpl(sl<LocationRemoteDataSource>()),
  );

  // 3. Use Cases
  sl.registerLazySingleton<GetAttendanceHistoryUseCase>(
        () => GetAttendanceHistoryUseCase(sl<AttendanceRepository>()),
  );
  sl.registerLazySingleton<GetTodayAttendanceUseCase>(
        () => GetTodayAttendanceUseCase(sl<AttendanceRepository>()),
  );
  sl.registerLazySingleton<StartAttendanceBreakUseCase>(
        () => StartAttendanceBreakUseCase(sl<AttendanceRepository>()),
  );
  sl.registerLazySingleton<EndAttendanceBreakUseCase>(
        () => EndAttendanceBreakUseCase(sl<AttendanceRepository>()),
  );
  sl.registerLazySingleton<ClockOutAttendanceUseCase>(
        () => ClockOutAttendanceUseCase(sl<AttendanceRepository>()),
  );
  sl.registerLazySingleton<ClockInAttendanceUseCase>(
        () => ClockInAttendanceUseCase(sl<AttendanceRepository>()),
  );
  sl.registerLazySingleton<GetCurrentLocationUseCase>(
        () => GetCurrentLocationUseCase(sl<LocationRepository>()),
  );
  sl.registerLazySingleton<GetUserInfoUseCase>(
        () => GetUserInfoUseCase(sl<AttendanceRepository>()),
  );
  sl.registerLazySingleton<GetAttendanceDetailsByIdUseCase>(
        () => GetAttendanceDetailsByIdUseCase(sl<AttendanceRepository>()),
  );

  // 4. Notifiers
  sl.registerLazySingleton<AttendanceNotifier>(
        () => AttendanceNotifier(),
  );

  // 5. Cubits
  sl.registerFactory<AttendanceScreenCubit>(
        () => AttendanceScreenCubit(
      getAttendanceHistoryUseCase: sl<GetAttendanceHistoryUseCase>(),
      getTodayAttendanceUseCase: sl<GetTodayAttendanceUseCase>(),
      startAttendanceBreakUseCase: sl<StartAttendanceBreakUseCase>(),
      endAttendanceBreakUseCase: sl<EndAttendanceBreakUseCase>(),
      clockOutAttendanceUseCase: sl<ClockOutAttendanceUseCase>(),
      attendanceNotifier: sl<AttendanceNotifier>(),
    ),
  );
  sl.registerFactory<ClockInFlowCubit>(
        () => ClockInFlowCubit(
      getCurrentLocation: sl<GetCurrentLocationUseCase>(),
      getUserInfo: sl<GetUserInfoUseCase>(),
      clockInAttendance: sl<ClockInAttendanceUseCase>(),
      attendanceNotifier: sl<AttendanceNotifier>(),
    ),
  );
  sl.registerFactory<DetailsHistoryCardCubit>(
        () => DetailsHistoryCardCubit(
      getDetailsUseCase: sl<GetAttendanceDetailsByIdUseCase>(),
    ),
  );
}