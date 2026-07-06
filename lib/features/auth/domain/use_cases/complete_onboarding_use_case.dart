import 'package:fpdart/fpdart.dart';
import '../../../../core/domain/failure/domain_failure.dart';
import '../repository/on_boarding_repository.dart';

class CompleteOnboardingUseCase {
  final OnboardingRepository _repository;

  CompleteOnboardingUseCase(this._repository);

  Future<Either<Failure, Unit>> call() {
    return _repository.saveOnboardingCompleted();
  }
}