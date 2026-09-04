import 'package:fpdart/fpdart.dart';
import 'package:workmate/features/auth/data/data_source/local/onboarding_local_data_source%20.dart';
import 'package:workmate/features/auth/domain/repository/on_boarding_repository.dart';
import '../../../../core/data/network/helper/safe_api_call.dart';
import '../../../../core/domain/failure/domain_failure.dart';

class OnboardingRepositoryImpl with SafeApiCall implements OnboardingRepository {
  final OnboardingLocalDataSource _localDataSource;

  OnboardingRepositoryImpl(this._localDataSource);

  @override
  Future<Either<Failure, bool>> isOnboardingCompleted() =>
      safeCacheCall(
        call: () async => _localDataSource.isOnboardingCompleted(),
      );

  @override
  Future<Either<Failure, Unit>> saveOnboardingCompleted() =>
      safeCacheCall(
        call: () async {
          await _localDataSource.saveOnboardingCompleted();
          return unit;
        },
      );
}
