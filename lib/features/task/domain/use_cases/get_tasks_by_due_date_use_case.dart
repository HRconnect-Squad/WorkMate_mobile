import 'package:fpdart/fpdart.dart';
import '../../../../core/domain/failure/domain_failure.dart';
import '../entity/task_list_entity.dart';
import '../repository/task_repository.dart';

class GetTasksByDueDateUseCase {
  final TaskRepository _repository;
  const GetTasksByDueDateUseCase(this._repository);

  Future<Either<Failure, TaskListEntity>> call(String dueDate) =>
      _repository.getTasksByDueDate(dueDate);
}
