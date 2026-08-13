import 'package:fpdart/fpdart.dart';
import '../../../../core/domain/failure/domain_failure.dart';
import '../entity/task_detail_entity.dart';
import '../repository/task_repository.dart';

class GetTaskDetailUseCase {
  final TaskRepository _repository;
  const GetTaskDetailUseCase(this._repository);

  Future<Either<Failure, TaskDetailEntity>> call(int taskId) =>
      _repository.getTaskById(taskId);
}