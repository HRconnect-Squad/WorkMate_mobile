import 'package:fpdart/fpdart.dart';
import '../../../../core/domain/failure/domain_failure.dart';

abstract class OnboardingRepository {
  Future<Either<Failure, Unit>> saveOnboardingCompleted();
  Future<Either<Failure, bool>> isOnboardingCompleted();
}
