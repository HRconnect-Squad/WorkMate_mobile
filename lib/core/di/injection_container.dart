import 'package:get_it/get_it.dart';
import 'package:workmate/features/auth/data/data_source/local/onboarding_local_data_source%20.dart';
import 'package:workmate/features/auth/data/data_source/local/onboarding_local_data_source_impl.dart';
import 'package:workmate/features/auth/data/repository_imp/on_boarding_repository_imp.dart';
import 'package:workmate/features/auth/domain/repository/auth_repository.dart';
import 'package:workmate/features/auth/domain/repository/on_boarding_repository.dart';
import 'package:workmate/features/auth/domain/use_cases/load_identifier_use_case.dart';
import 'package:workmate/features/auth/domain/use_cases/login_use_case.dart';
import 'package:workmate/features/auth/domain/use_cases/register_use_case.dart';
import 'package:workmate/features/auth/presentation/login/logic/login_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../features/auth/data/data_source/local/auth_local_data_source.dart';
import '../../features/auth/data/data_source/local/auth_local_data_source_imp.dart';
import '../../features/auth/data/data_source/remote/auth_remote_data_source.dart';
import '../../features/auth/data/data_source/remote/auth_remote_data_source_impl.dart';
import '../../features/auth/data/repository_imp/auth_repository_imp.dart';
import '../../features/auth/domain/use_cases/change_password_use_case.dart';
import '../../features/auth/domain/use_cases/logout_use_case.dart';
import '../../features/auth/domain/use_cases/reset_password_use_case.dart';
import '../../features/auth/domain/use_cases/check_onboarding_status_use_case.dart';
import '../../features/auth/domain/use_cases/complete_onboarding_use_case.dart';
import '../../features/auth/domain/use_cases/otp_use_case.dart';
import '../../features/auth/domain/use_cases/forgot_password_use_case.dart';
import '../../features/auth/presentation/change_password/logic/change_password_cubit.dart';
import '../../features/auth/presentation/forget_password/logic/forgot_password_cubit.dart';
import '../../features/auth/presentation/on_boarding/logic/on_boarding_cubit.dart';
import '../../features/auth/presentation/register/signup/logic/sign_up_cubit.dart';
import '../../features/auth/presentation/register/verify_otp_popup/logic/verify_otp_cubit.dart';
import '../../features/auth/presentation/reset_password/logic/reset_password_cubit.dart';
import '../../features/expense/data/datasource/remote/expense_remote_data_source.dart';
import '../../features/expense/data/datasource/remote/expense_remote_data_source_impl.dart';
import '../../features/expense/data/repository/expense_repository_impl.dart';
import '../../features/expense/domain/repository/expense_repository.dart';
import '../../features/expense/domain/usecase/create_expense_usecase.dart';
import '../../features/expense/domain/usecase/delete_expense_usecase.dart';
import '../../features/expense/domain/usecase/get_expense_detail_usecase.dart';
import '../../features/expense/domain/usecase/get_expenses_usecase.dart';
import '../../features/expense/domain/usecase/update_expense_usecase.dart';
import '../../features/expense/domain/usecase/upload_receipt_usecase.dart';
import '../../features/expense/presentation/logic/expenses_cubit.dart';
import '../../features/profile/data/datasource/local/profile_local_data_source.dart';
import '../../features/profile/data/datasource/local/profile_local_data_source_impl.dart';
import '../../features/profile/data/datasource/remote/profile_remote_data_source.dart';
import '../../features/profile/data/datasource/remote/profile_remote_data_source_impl.dart';
import '../../features/profile/data/repository_imp/profile_repository_impl.dart';
import '../../features/profile/domain/repository/profile_repository.dart';
import '../../features/profile/domain/usecase/complete_profile_usecase.dart';
import '../../features/profile/domain/usecase/get_office_assets_usecase.dart';
import '../../features/profile/domain/usecase/get_payroll_history_usecase.dart';
import '../../features/profile/domain/usecase/get_profile_usecase.dart';
import '../../features/profile/domain/usecase/update_profile_usecase.dart';
import '../../features/profile/domain/usecase/upload_profile_image_usecase.dart';
import '../../features/profile/presentation/office_assets/logic/office_assets_cubit.dart';
import '../../features/profile/presentation/payroll/logic/payroll_cubit.dart';
import '../../features/profile/presentation/personal_data/logic/personal_data_cubit.dart';
import '../../features/profile/presentation/profile/logic/profile_cubit.dart';
import '../data/cache/cache_manager.dart';
import '../data/cache/secure_storage_data_source.dart';
import '../data/cache/shared_preferences_service.dart';
import '../data/network/dio_client.dart';
import '../presentation/routes/config/app_startup_service.dart';

final sl = GetIt.instance;

Future<void> setupDependencies() async {
  await _initCore();
  await _initAuth();
  await _initOnboarding();
  await _initProfile();
  await _initExpenses();
}

Future<void> _initCore() async {
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

Future<void> _initAuth() async {
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
  sl.registerLazySingleton<ForgotPasswordUseCase>(
    () => ForgotPasswordUseCase(sl<AuthRepository>()),
  );
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

  //presentation
  sl.registerFactory<ForgotPasswordCubit>(
    () => ForgotPasswordCubit(sl<ForgotPasswordUseCase>()),
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
        () => VerifyOtpCubit(sl<VerifyOTPUseCase>()),
  );
  sl.registerFactory<ChangePasswordCubit>(
        () => ChangePasswordCubit(
      changePasswordUseCase: sl<ChangePasswordUseCase>(),
      logoutUseCase: sl<LogoutUseCase>(),
    ),
  );
}

Future<void> _initOnboarding() async {
  //data
  sl.registerLazySingleton<OnboardingLocalDataSource>(
    () => OnboardingLocalDataSourceImpl(sl<PreferencesService>()),
  );
  sl.registerLazySingleton<OnboardingRepository>(
    () => OnboardingRepositoryImpl(sl<OnboardingLocalDataSource>()),
  );

  //domain
  sl.registerLazySingleton<CompleteOnboardingUseCase>(
    () => CompleteOnboardingUseCase(sl<OnboardingRepository>()),
  );
  sl.registerLazySingleton<CheckOnboardingStatusUseCase>(
    () => CheckOnboardingStatusUseCase(sl<OnboardingRepository>()),
  );

  //presentation
  sl.registerFactory<OnboardingCubit>(
    () => OnboardingCubit(
      completeOnboardingUseCase: sl<CompleteOnboardingUseCase>(),
    ),
  );
}

Future<void> _initProfile() async {
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

Future<void> _initExpenses() async {
  // data
  sl.registerLazySingleton<ExpensesRemoteDataSource>(
        () => ExpensesRemoteDataSourceImpl(dioClient: sl<DioClient>()),
  );
  sl.registerLazySingleton<ExpensesRepository>(
        () => ExpensesRepositoryImpl(remoteDataSource: sl<ExpensesRemoteDataSource>()),
  );

  // domain
  sl.registerLazySingleton(() => GetExpensesUseCase(sl<ExpensesRepository>()));
  sl.registerLazySingleton(() => GetExpenseDetailUseCase(sl<ExpensesRepository>()));
  sl.registerLazySingleton(() => CreateExpenseUseCase(sl<ExpensesRepository>()));
  sl.registerLazySingleton(() => UpdateExpenseUseCase(sl<ExpensesRepository>()));
  sl.registerLazySingleton(() => DeleteExpenseUseCase(sl<ExpensesRepository>()));
  sl.registerLazySingleton(() => UploadReceiptUseCase(sl<ExpensesRepository>()));

  // presentation
  sl.registerFactory<ExpensesCubit>(
        () => ExpensesCubit(
      getExpensesUseCase: sl<GetExpensesUseCase>(),
      deleteExpenseUseCase: sl<DeleteExpenseUseCase>(),
      createExpenseUseCase: sl<CreateExpenseUseCase>(),
      uploadReceiptUseCase: sl<UploadReceiptUseCase>(),
    ),
  );

}
