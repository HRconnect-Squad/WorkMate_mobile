import 'package:fpdart/fpdart.dart';
import '../../../../core/domain/failure/domain_failure.dart';
import '../entity/task_entity.dart';
import '../repository/task_repository.dart';

class GetTasksUseCase {
  final TaskRepository _repository;
  const GetTasksUseCase(this._repository);

  Future<Either<Failure, List<TaskEntity>>> call() =>
      _repository.getTasks();
}