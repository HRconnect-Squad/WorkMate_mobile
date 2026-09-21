import 'package:fpdart/fpdart.dart';
import '../../../../core/domain/failure/domain_failure.dart';
import '../entity/task_entity.dart';
import '../entity/task_detail_entity.dart';
import '../entity/comment_entity.dart';

abstract class TaskRepository {
  Future<Either<Failure, List<TaskEntity>>> getTasks();
  Future<Either<Failure, TaskDetailEntity>> getTaskById(int id);
  Future<Either<Failure, List<CommentEntity>>> getComments(int id);
  Future<Either<Failure, Unit>> addComment(int taskId, String comment);
}