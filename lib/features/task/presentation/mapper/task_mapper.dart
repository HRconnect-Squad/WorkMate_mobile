import '../../../../core/presentation/design_system/model/comment_model.dart';
import '../../../../core/presentation/design_system/model/task_model.dart';
import '../../domain/entity/comment_entity.dart';
import '../../domain/entity/task_entity.dart';
import '../../utils/parsing.dart';

class TaskMapper {
  /// Home-card variant: avatars come from `assignees` (not comments) and the
  /// real server progress is shown.
  static TaskModel toUiHomeTask(TaskEntity entity) => TaskModel(
    id: entity.id,
    title: entity.title,
    priority: entity.priority,
    status: entity.status,
    date: formatDate(entity.dueDate ?? entity.createdAt),
    commentsCount: entity.commentsCount,
    attachmentsCount: entity.attachmentsCount,
    assigneeAvatarUrls: entity.assignees.map((a) => a.avatarUrl).toList(),
    assigneesCount: entity.assigneesCount,
    progress: entity.progressPercentage / 100,
  );

  static TaskModel toUiTaskState(TaskEntity entity) => TaskModel(
    id: entity.id,
    title: entity.title,
    priority: entity.priority,
    status: entity.status,
    date: formatDate(entity.dueDate ?? entity.createdAt),
    commentAvatarUrls: entity.commentAvatarUrls,
    commentsCount: entity.commentsCount,
  );

  static CommentModel toUiCommentState(CommentEntity entity) => CommentModel(
    idComment: entity.id.toString(),
    idCommenter: entity.commenterEmail,
    dateComment: formatDate(entity.createdAt),
    commenterImage: entity.commenterImage,
    commentMassage: entity.comment,
    commenterName: entity.commenterEmail,
    commenterPosition: entity.commenterRole,
  );
}