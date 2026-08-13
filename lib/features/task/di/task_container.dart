import '../../../core/data/network/dio_client.dart';
import '../../../core/di/core_di_container.dart';
import '../data/remote/task_remote_data_source.dart';
import '../data/remote/task_remote_data_source_impl.dart';
import '../data/repository_imp/task_repository_impl.dart';
import '../domain/repository/task_repository.dart';
import '../domain/use_cases/add_comment_use_case.dart';
import '../domain/use_cases/get_task_detail_use_case.dart';
import '../domain/use_cases/get_tasks_use_case.dart';
import '../presentation/login/task_cubit.dart';
import '../presentation/login/task_detail_cubit.dart';

Future<void> initTask() async {

  sl.registerLazySingleton<TaskRemoteDataSource>(
        () => TaskRemoteDataSourceImpl(dioClient: sl<DioClient>()),
  );
  sl.registerLazySingleton<TaskRepository>(
        () => TaskRepositoryImpl(remote: sl<TaskRemoteDataSource>()),
  );

  sl.registerLazySingleton(() => GetTasksUseCase(sl<TaskRepository>()));
  sl.registerLazySingleton(() => GetTaskDetailUseCase(sl<TaskRepository>()));
  sl.registerLazySingleton(() => AddCommentUseCase(sl<TaskRepository>()));

  sl.registerFactory(() => TaskCubit(sl<GetTasksUseCase>()));

  sl.registerFactoryParam<TaskDetailCubit, int, void>(
        (taskId, _) => TaskDetailCubit(
      sl<GetTaskDetailUseCase>(),
      sl<AddCommentUseCase>(),
      taskId,
    ),
  );
}