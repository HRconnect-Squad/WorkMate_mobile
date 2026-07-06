import '../../../core/data/cache/secure_storage_data_source.dart';
import '../../../core/data/cache/shared_preferences_service.dart';
import '../../../core/data/network/dio_client.dart';
import '../../../core/di/core_di_container.dart';
import '../../../core/domain/service/cache_manager.dart';
import '../data/data_source/local/auth_local_data_source.dart';
import '../data/data_source/local/auth_local_data_source_imp.dart';
import '../data/data_source/remote/auth_remote_data_source.dart';
import '../data/data_source/remote/auth_remote_data_source_impl.dart';
import '../data/repository_imp/auth_repository_imp.dart';
import '../domain/repository/auth_repository.dart';
import '../domain/use_cases/change_password_use_case.dart';
import '../domain/use_cases/check_forgot_password_otp_use_case.dart';
import '../domain/use_cases/load_identifier_use_case.dart';
import '../domain/use_cases/login_use_case.dart';
import '../domain/use_cases/logout_use_case.dart';
import '../domain/use_cases/otp_use_case.dart';
import '../domain/use_cases/register_use_case.dart';
import '../domain/use_cases/reset_password_use_case.dart';
import '../domain/use_cases/send_otp_use_case.dart';
import '../presentation/change_password/logic/change_password_cubit.dart';
import '../presentation/forget_password/logic/forgot_password_cubit.dart';
import '../presentation/forget_password/logic/verify_forgot_password_otp_cubit.dart';
import '../presentation/login/logic/login_cubit.dart';
import '../presentation/register/signup/logic/sign_up_cubit.dart';
import '../presentation/register/verify_otp_popup/logic/verify_otp_cubit.dart';
import '../presentation/reset_password/logic/reset_password_cubit.dart';


Future<void> initAuth() async {
  //data
  sl.registerLazySingleton<AuthLocalDataSource>(
        () => AuthLocalDataSourceImp(
      secureStorageService: sl<SecureStorageService>(),
      preferencesService: sl<PreferencesService>(),
    ),
  );
  sl.registerLazySingleton<DioClient>(
        () => DioClient(sl<AuthLocalDataSource>()),
  );
  sl.registerLazySingleton<AuthRemoteDataSource>(
        () => AuthRemoteDataSourceImp(dioClient: sl<DioClient>()),
  );
  sl.registerLazySingleton<AuthRepository>(
        () => AuthRepositoryImp(
      localDataSource: sl<AuthLocalDataSource>(),
      remoteDataSource: sl<AuthRemoteDataSource>(),
    ),
  );

  //domain
  sl.registerLazySingleton<ResetPasswordUseCase>(
        () => ResetPasswordUseCase(sl<AuthRepository>()),
  );
  sl.registerLazySingleton(() => LoginUseCase(sl<AuthRepository>()));
  sl.registerLazySingleton(() => LoadIdentifierUseCase(sl<AuthRepository>()));
  sl.registerLazySingleton<RegisterUseCase>(
        () => RegisterUseCase(sl<AuthRepository>()),
  );
  sl.registerLazySingleton<VerifyOTPUseCase>(
        () => VerifyOTPUseCase(sl<AuthRepository>()),
  );
  sl.registerLazySingleton(() => LogoutUseCase(
    authRepository: sl<AuthRepository>(),
    cacheManager: sl<CacheManager>(),)
  );
  sl.registerLazySingleton<ChangePasswordUseCase>(
        () => ChangePasswordUseCase(sl<AuthRepository>()),
  );
  sl.registerLazySingleton<SendOtpUseCase>(
        () => SendOtpUseCase(sl<AuthRepository>()),
  );
  sl.registerLazySingleton<CheckForgotPasswordOtpUseCase>(
        () => CheckForgotPasswordOtpUseCase(sl<AuthRepository>()),
  );



  //presentation
  sl.registerFactory<ForgotPasswordCubit>(
        () => ForgotPasswordCubit(sl<SendOtpUseCase>()),
  );
  sl.registerFactory<VerifyForgotPasswordOtpCubit>(
        () => VerifyForgotPasswordOtpCubit(
      sl<CheckForgotPasswordOtpUseCase>(),
      sl<SendOtpUseCase>(),
    ),
  );
  sl.registerFactory<ResetPasswordCubit>(
        () => ResetPasswordCubit(sl<ResetPasswordUseCase>()),
  );
  sl.registerFactory(
        () => LoginCubit(sl<LoginUseCase>(), sl<LoadIdentifierUseCase>()),
  );
  sl.registerFactory<SignUpCubit>(
          () => SignUpCubit(sl<RegisterUseCase>()));
  sl.registerFactory<VerifyOtpCubit>(
        () => VerifyOtpCubit(sl<VerifyOTPUseCase>(), sl<SendOtpUseCase>()),
  );
  sl.registerFactory<ChangePasswordCubit>(
        () => ChangePasswordCubit(
      changePasswordUseCase: sl<ChangePasswordUseCase>(),
      logoutUseCase: sl<LogoutUseCase>(),
    ),
  );
}