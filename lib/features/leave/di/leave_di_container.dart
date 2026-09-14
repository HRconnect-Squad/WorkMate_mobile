

import '../../../core/data/network/dio_client.dart';
import '../../../core/di/core_di_container.dart';
import '../data/datasource/remote/leave_remote_datasource.dart';
import '../data/datasource/remote/leave_remote_datasource_impl.dart';
import '../data/repository_impl/leave_repository_impl.dart';
import '../domain/repository/leave_repository.dart';
import '../domain/usecase/cancel_leave_request_usecase.dart';
import '../domain/usecase/get_leave_balance_usecase.dart';
import '../domain/usecase/get_leave_types_usecase.dart';
import '../domain/usecase/get_my_leave_requests_usecase.dart';
import '../domain/usecase/submit_leave_request_usecase.dart';
import '../presentation/summary/logic/leave_summary_cubit.dart';
import '../presentation/submit/logic/submit_leave_cubit.dart';

Future<void> initLeave() async {
  // data
  sl.registerLazySingleton<LeaveRemoteDataSource>(
        () => LeaveRemoteDataSourceImpl(dioClient: sl<DioClient>()),
  );

  sl.registerLazySingleton<LeaveRepository>(
        () => LeaveRepositoryImpl(remoteDataSource: sl<LeaveRemoteDataSource>()),
  );

  // domain
  sl.registerLazySingleton<GetLeaveTypesUseCase>(
        () => GetLeaveTypesUseCase(sl<LeaveRepository>()),
  );
  sl.registerLazySingleton<GetMyLeaveRequestsUseCase>(
        () => GetMyLeaveRequestsUseCase(sl<LeaveRepository>()),
  );
  sl.registerLazySingleton<SubmitLeaveRequestUseCase>(
        () => SubmitLeaveRequestUseCase(sl<LeaveRepository>()),
  );
  sl.registerLazySingleton<GetLeaveBalanceUseCase>(
        () => GetLeaveBalanceUseCase(sl<LeaveRepository>()),
  );
  sl.registerLazySingleton<CancelLeaveRequestUseCase>(
        () => CancelLeaveRequestUseCase(sl<LeaveRepository>()),
  );

  // presentation
  sl.registerFactory<LeaveSummaryCubit>(
        () => LeaveSummaryCubit(
      getLeaveBalanceUseCase: sl<GetLeaveBalanceUseCase>(),
      getMyLeaveRequestsUseCase: sl<GetMyLeaveRequestsUseCase>(),
      cancelLeaveRequestUseCase: sl<CancelLeaveRequestUseCase>(),
    ),
  );

  sl.registerFactory<SubmitLeaveCubit>(
        () => SubmitLeaveCubit(
      getLeaveTypesUseCase: sl<GetLeaveTypesUseCase>(),
      submitLeaveRequestUseCase: sl<SubmitLeaveRequestUseCase>(),
    ),
  );
}