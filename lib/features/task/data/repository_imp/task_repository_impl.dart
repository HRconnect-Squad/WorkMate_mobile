import 'package:fpdart/fpdart.dart';
import '../../../../core/domain/failure/domain_failure.dart';
import '../../domain/entity/comment_entity.dart';
import '../../domain/entity/task_detail_entity.dart';
import '../../domain/entity/task_entity.dart';
import '../../domain/repository/task_repository.dart';
import '../mapper/task_mapper.dart';
import '../remote/dto/add_comment_request_dto.dart';
import '../remote/task_remote_data_source.dart';

class TaskRepositoryImpl implements TaskRepository {
  final TaskRemoteDataSource _remote;

  const TaskRepositoryImpl({required TaskRemoteDataSource remote})
      : _remote = remote;


  @override
  Future<Either<Failure, List<TaskEntity>>> getTasks() async {
      final dtos = await _remote.getTasks();
      return Right(dtos.map(TaskMapper.toDomainTask).toList());

  }

  @override
  Future<Either<Failure, TaskDetailEntity>> getTaskById(int id) async {
      final dto = await _remote.getTaskById(id);
      return Right(TaskMapper.toDomainDetail(dto));
  }

  @override
  Future<Either<Failure, List<CommentEntity>>> getComments(int id) async {
      final dtos = await _remote.getComments(id);
      return Right(dtos.map(TaskMapper.toDomainComment).toList());
  }

  @override
  Future<Either<Failure, Unit>> addComment(int taskId, String comment) async {
      await _remote.addComment(taskId, AddCommentRequestDto(comment: comment));
      return const Right(unit);
  }
}