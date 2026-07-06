import 'package:fpdart/fpdart.dart';
import '../../../../core/domain/failure/domain_failure.dart';
import '../entity/employee_profile.dart';
import '../repository/profile_repository.dart';

class GetProfileUseCase {
  final ProfileRepository _repository;

  const GetProfileUseCase(this._repository);

  Future<Either<Failure, EmployeeProfile>> call() {
    return _repository.getProfile();
  }
}