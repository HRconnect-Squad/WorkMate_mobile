import '../../../../../core/data/network/dio_client.dart';
import '../../../../core/data/network/constant/api_constant.dart';
import 'dto/add_comment_request_dto.dart';
import 'dto/comment_dto.dart';
import 'dto/task_detail_dto.dart';
import 'dto/task_dto.dart';
import 'task_remote_data_source.dart';

class TaskRemoteDataSourceImpl implements TaskRemoteDataSource {
  final DioClient _dioClient;

  const TaskRemoteDataSourceImpl({required DioClient dioClient})
      : _dioClient = dioClient;

  @override
  Future<List<TaskDto>> getTasks() async {
    final response = await _dioClient.get(ApiConstants.tasks);
    final data = response.data['data'] as Map<String, dynamic>;
    final tasks = data['tasks'] as List<dynamic>;
    return tasks
        .map((e) => TaskDto.fromJson(e as Map<String, dynamic>))
        .toList();
  }


  @override
  Future<TaskDetailDto> getTaskById(int id) async {
    final response = await _dioClient.get(ApiConstants.taskById(id));
    final data = response.data['data'] as Map<String, dynamic>;
    return TaskDetailDto.fromJson(data);
  }


  @override
  Future<List<CommentDto>> getComments(int id) async {
    final response = await _dioClient.get(ApiConstants.taskComments(id));
    final data = response.data['data'] as List<dynamic>;
    return data
        .map((e) => CommentDto.fromJson(e as Map<String, dynamic>))
        .toList();
  }


  @override
  Future<void> addComment(int taskId, AddCommentRequestDto request) async {
    await _dioClient.post(
      ApiConstants.taskComments(taskId),
      data: request.toJson(),
    );
  }
}