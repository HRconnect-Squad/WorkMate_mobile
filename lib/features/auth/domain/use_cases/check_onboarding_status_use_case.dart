import 'package:fpdart/fpdart.dart';
import '../../../../core/domain/failure/domain_failure.dart';
import '../repository/on_boarding_repository.dart';

class CheckOnboardingStatusUseCase {
  final OnboardingRepository _repository;

  CheckOnboardingStatusUseCase(this._repository);

  Future<Either<Failure, bool>> call() {
    return _repository.isOnboardingCompleted();
  }
}
