import '../../../../core/presentation/design_system/model/task_priority_enums.dart';
import '../../../../core/presentation/design_system/model/task_status_enums.dart';
import 'comment_entity.dart';

class TaskEntity {
  final int id;
  final String title;
  final String? description;
  final String? dueDate;
  final TaskPriority priority;
  final TaskStatus status;
  final int progressPercentage;
  final String? assigneeEmail;
  final String? assigneeName;
  final String createdAt;
  final List<CommentEntity> comments;
  final int commentsCount;

  const TaskEntity({
    required this.id,
    required this.title,
    this.description,
    this.dueDate,
    required this.priority,
    required this.status,
    required this.progressPercentage,
    this.assigneeEmail,
    this.assigneeName,
    required this.createdAt,
    this.comments = const [],
    this.commentsCount = 0,
  });
}