import 'package:fpdart/fpdart.dart';
import '../../../../core/domain/failure/domain_failure.dart';
import '../repository/home_repository.dart';

class GetUnreadMessagesCountUseCase {
  final HomeRepository _repository;
  const GetUnreadMessagesCountUseCase(this._repository);

  Future<Either<Failure, int>> call() => _repository.getUnreadMessagesCount();
}
