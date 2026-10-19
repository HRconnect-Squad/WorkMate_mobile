import 'package:fpdart/fpdart.dart';

import '../../../../core/domain/failure/domain_failure.dart';
import '../repository/auth_repository.dart';

class GetCurrentUserIdUseCase {
  final AuthRepository _repository;
  const GetCurrentUserIdUseCase(this._repository);

  Future<Either<Failure, int>> call() => _repository.getCurrentUserId();
}