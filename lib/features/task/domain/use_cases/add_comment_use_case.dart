import 'package:fpdart/fpdart.dart';
import '../../../../core/domain/failure/domain_failure.dart';
import '../repository/task_repository.dart';

class AddCommentUseCase {
  final TaskRepository _repository;
  const AddCommentUseCase(this._repository);

  Future<Either<Failure, Unit>> call(int taskId, String comment) =>
      _repository.addComment(taskId, comment);
}