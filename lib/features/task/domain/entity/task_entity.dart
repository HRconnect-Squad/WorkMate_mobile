import '../../../../core/presentation/design_system/model/task_priority_enums.dart';
import '../../../../core/presentation/design_system/model/task_status_enums.dart';
import 'task_assignee_entity.dart';

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
  final List<String?> commentAvatarUrls;
  final int commentsCount;
  final int attachmentsCount;
  final List<TaskAssigneeEntity> assignees;
  final int assigneesCount;

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
    this.commentAvatarUrls = const [],
    this.commentsCount = 0,
    this.attachmentsCount = 0,
    this.assignees = const [],
    this.assigneesCount = 0,
  });
}