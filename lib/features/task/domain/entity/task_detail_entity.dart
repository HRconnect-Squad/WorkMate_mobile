import 'comment_entity.dart';
import 'task_entity.dart';

class TaskDetailEntity {
  final TaskEntity task;
  final List<CommentEntity> comments;
  final List<String> attachmentUrls;

  const TaskDetailEntity({
    required this.task,
    required this.comments,
    required this.attachmentUrls,
  });
}