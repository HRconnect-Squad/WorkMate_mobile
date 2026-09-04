import '../../../core/data/cache/shared_preferences_service.dart';
import '../../../core/di/core_di_container.dart';
import '../data/data_source/local/onboarding_local_data_source .dart';
import '../data/data_source/local/onboarding_local_data_source_impl.dart';
import '../data/repository_imp/on_boarding_repository_imp.dart';
import '../domain/repository/on_boarding_repository.dart';
import '../domain/use_cases/check_onboarding_status_use_case.dart';
import '../domain/use_cases/complete_onboarding_use_case.dart';
import '../presentation/on_boarding/logic/on_boarding_cubit.dart';


Future<void> initOnboarding() async {
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