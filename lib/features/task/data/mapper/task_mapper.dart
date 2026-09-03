import '../../../../core/presentation/design_system/model/task_priority_enums.dart';
import '../../../../core/presentation/design_system/model/task_status_enums.dart';
import '../../domain/entity/task_entity.dart';
import '../../domain/entity/task_detail_entity.dart';
import '../../domain/entity/comment_entity.dart';
import '../remote/dto/comment_dto.dart';
import '../remote/dto/task_detail_dto.dart';
import '../remote/dto/task_dto.dart';

class TaskMapper {

  static TaskEntity toDomainTask(TaskDto dto) => TaskEntity(
    id: dto.id,
    title: dto.title,
    description: dto.description,
    dueDate: dto.dueDate,
    priority: _mapPriority(dto.priority),
    status: _mapStatus(dto.status),
    progressPercentage: dto.progressPercentage,
    assigneeEmail: dto.assignedTo?.email,
    assigneeName: dto.assignedTo?.email,
    createdAt: dto.createdAt,
    commentsCount: dto.commentsCount,
    commentAvatarUrls: dto.comments.map((c) => c.profileImage).toList(),
  );

  static TaskDetailEntity toDomainDetail(TaskDetailDto dto) => TaskDetailEntity(
    task: TaskEntity(
      id: dto.id,
      title: dto.title,
      description: dto.description,
      dueDate: dto.dueDate,
      priority: _mapPriority(dto.priority),
      status: _mapStatus(dto.status),
      progressPercentage: dto.progressPercentage,
      assigneeEmail: dto.assignedTo?.email,
      assigneeName: dto.assignedTo?.email,
      createdAt: dto.createdAt,
    ),
    comments: dto.comments.map(toDomainComment).toList(),
    attachmentUrls: const [],
  );

  static CommentEntity toDomainComment(CommentDto dto) => CommentEntity(
    id: dto.id,
    comment: dto.comment,
    commenterEmail: dto.user.email,
    commenterImage: dto.image,
    commenterRole: dto.user.role,
    createdAt: dto.createdAt,
  );

  static TaskPriority _mapPriority(String raw) => switch (raw.toLowerCase()) {
    'high' => TaskPriority.high,
    'medium' => TaskPriority.medium,
    'low' => TaskPriority.low,
    _ => TaskPriority.high,
  };

  static TaskStatus _mapStatus(String raw) => switch (raw.toLowerCase()) {
    'pending' => TaskStatus.review,
    'in_progress' => TaskStatus.inProgress,
    'completed' => TaskStatus.done,
    _ => TaskStatus.inProgress
  };
}