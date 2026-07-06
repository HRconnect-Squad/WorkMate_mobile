import 'package:fpdart/fpdart.dart';
import 'package:workmate/features/auth/data/data_source/local/onboarding_local_data_source%20.dart';
import 'package:workmate/features/auth/data/mappers/auth_failure_mapper.dart';
import 'package:workmate/features/auth/domain/repository/on_boarding_repository.dart';
import '../../../../core/domain/failure/domain_failure.dart';

class OnboardingRepositoryImpl implements OnboardingRepository {
  final OnboardingLocalDataSource _localDataSource;

  OnboardingRepositoryImpl(this._localDataSource);

  @override
  Future<Either<Failure, bool>> isOnboardingCompleted() async {
    try {
      final result = _localDataSource.isOnboardingCompleted();
      return Right(result);
    } catch (e) {
      return Left(AuthFailureMapper.mapException(e));
    }
  }

  @override
  Future<Either<Failure, Unit>> saveOnboardingCompleted() async {
    try {
      await _localDataSource.saveOnboardingCompleted();
      return const Right(unit);
    } catch (e) {
      return Left(AuthFailureMapper.mapException(e));
    }
  }
}
