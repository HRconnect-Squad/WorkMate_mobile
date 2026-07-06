import 'package:fpdart/fpdart.dart';
import 'package:workmate/features/auth/domain/repository/auth_repository.dart';
import '../../../../core/domain/failure/domain_failure.dart';

class LoadIdentifierUseCase {
  final AuthRepository _repository;

  const LoadIdentifierUseCase(this._repository);

  Future<Either<Failure, String?>> call() async {
    return await _repository.getIdentifier();
  }
}
