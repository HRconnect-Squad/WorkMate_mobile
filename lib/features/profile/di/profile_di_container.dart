import '../../../core/data/cache/shared_preferences_service.dart';
import '../../../core/data/network/dio_client.dart';
import '../../../core/di/core_di_container.dart';
import '../../auth/domain/use_cases/load_identifier_use_case.dart';
import '../../auth/domain/use_cases/logout_use_case.dart';
import '../data/datasource/local/profile_local_data_source.dart';
import '../data/datasource/local/profile_local_data_source_impl.dart';
import '../data/datasource/remote/profile_remote_data_source.dart';
import '../data/datasource/remote/profile_remote_data_source_impl.dart';
import '../data/repository_imp/profile_repository_impl.dart';
import '../domain/repository/profile_repository.dart';
import '../domain/usecase/complete_profile_usecase.dart';
import '../domain/usecase/get_office_assets_usecase.dart';
import '../domain/usecase/get_payroll_history_usecase.dart';
import '../domain/usecase/get_profile_usecase.dart';
import '../domain/usecase/update_profile_usecase.dart';
import '../domain/usecase/upload_profile_image_usecase.dart';
import '../presentation/office_assets/logic/office_assets_cubit.dart';
import '../presentation/payroll/logic/payroll_cubit.dart';
import '../presentation/personal_data/logic/personal_data_cubit.dart';
import '../presentation/profile/logic/profile_cubit.dart';


Future<void> initProfile() async {
  //data
  sl.registerLazySingleton<ProfileLocalDataSource>(
        () => ProfileLocalDataSourceImpl(preferencesService: sl<PreferencesService>()),
  );
  sl.registerLazySingleton<ProfileRemoteDataSource>(
        () => ProfileRemoteDataSourceImpl(
      dioClient: sl<DioClient>(),
    ),
  );
  sl.registerLazySingleton<ProfileRepository>(
        () => ProfileRepositoryImpl(
      remoteDataSource: sl<ProfileRemoteDataSource>(),
      localDataSource: sl<ProfileLocalDataSource>(),
    ),
  );

  //domain
  sl.registerLazySingleton<GetProfileUseCase>(
        () => GetProfileUseCase(sl<ProfileRepository>()),
  );
  sl.registerLazySingleton<UploadProfileImageUseCase>(
        () => UploadProfileImageUseCase(sl<ProfileRepository>()),
  );
  sl.registerLazySingleton<CompleteProfileUseCase>(
        () => CompleteProfileUseCase(sl<ProfileRepository>()),
  );
  sl.registerLazySingleton<UpdateProfileUseCase>(
        () => UpdateProfileUseCase(sl<ProfileRepository>()),
  );

  sl.registerLazySingleton<GetPayrollHistoryUseCase>(
        () => GetPayrollHistoryUseCase(sl<ProfileRepository>()),
  );
  sl.registerLazySingleton<GetOfficeAssetsUseCase>(
        () => GetOfficeAssetsUseCase(sl<ProfileRepository>()),
  );

  //presentation
  sl.registerFactory<ProfileCubit>(
        () => ProfileCubit(
      getProfileUseCase: sl<GetProfileUseCase>(),
      uploadProfileImageUseCase: sl<UploadProfileImageUseCase>(),
      loadIdentifierUseCase: sl<LoadIdentifierUseCase>(),
      completeProfileUseCase: sl<CompleteProfileUseCase>(),
      logoutUseCase: sl<LogoutUseCase>(),
    ),
  );
  sl.registerFactory<PersonalDataCubit>(
        () => PersonalDataCubit(
      updateProfileUseCase: sl<UpdateProfileUseCase>(),
      getProfileUseCase: sl<GetProfileUseCase>(),
    ),
  );
  sl.registerFactory<PayrollCubit>(
        () => PayrollCubit(
      getPayrollHistoryUseCase: sl<GetPayrollHistoryUseCase>(),
    ),
  );
  sl.registerFactory<OfficeAssetsCubit>(
        () => OfficeAssetsCubit(
      getOfficeAssetsUseCase: sl<GetOfficeAssetsUseCase>(),
    ),
  );

}