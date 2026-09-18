import 'package:fpdart/fpdart.dart';
import '../../../../core/data/network/helper/safe_api_call.dart';
import '../../../../core/domain/failure/domain_failure.dart';
import '../../domain/entity/comment_entity.dart';
import '../../domain/entity/task_detail_entity.dart';
import '../../domain/entity/task_entity.dart';
import '../../domain/repository/task_repository.dart';
import '../mapper/task_mapper.dart';
import '../remote/dto/add_comment_request_dto.dart';
import '../remote/task_remote_data_source.dart';

class TaskRepositoryImpl with SafeApiCall implements TaskRepository {
  final TaskRemoteDataSource _remote;

  const TaskRepositoryImpl({required TaskRemoteDataSource remote})
      : _remote = remote;

  @override
  Future<Either<Failure, List<TaskEntity>>> getTasks() async {
    return safeApiCall(call: () async {
      final dtos = await _remote.getTasks();
      return dtos.map(TaskMapper.toDomainTask).toList();
    });
  }

  @override
  Future<Either<Failure, TaskDetailEntity>> getTaskById(int id) async {
    return safeApiCall(call: () async {
      final dto = await _remote.getTaskById(id);
      return TaskMapper.toDomainDetail(dto);
    });
  }

  @override
  Future<Either<Failure, List<CommentEntity>>> getComments(int id) async {
    return safeApiCall(call: () async {
      final dtos = await _remote.getComments(id);
      return dtos.map(TaskMapper.toDomainComment).toList();
    });
  }

  @override
  Future<Either<Failure, Unit>> addComment(int taskId, String comment) async {
    return safeApiCall(call: () async {
      await _remote.addComment(taskId, AddCommentRequestDto(comment: comment));
      return unit;
    });
  }
}