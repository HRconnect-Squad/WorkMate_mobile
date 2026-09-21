import 'dto/add_comment_request_dto.dart';
import 'dto/comment_dto.dart';
import 'dto/task_detail_dto.dart';
import 'dto/task_dto.dart';

abstract class TaskRemoteDataSource {
  Future<List<TaskDto>> getTasks();
  Future<TaskDetailDto> getTaskById(int id);
  Future<List<CommentDto>> getComments(int id);
  Future<void> addComment(int taskId, AddCommentRequestDto request);
}