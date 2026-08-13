import '../../../../core/presentation/design_system/model/comment_model.dart';
import '../../../../core/presentation/design_system/model/task_model.dart';
import '../../domain/entity/comment_entity.dart';
import '../../domain/entity/task_entity.dart';
import '../../utils/parsing.dart';

class TaskMapper {
  static TaskModel toUiTaskState(TaskEntity entity) => TaskModel(
    id: entity.id,
    title: entity.title,
    priority: entity.priority,
    status: entity.status,
    date: formatDate(entity.dueDate ?? entity.createdAt),
    comments: entity.comments.map(toUiCommentState).toList(),
    commentsCount: entity.commentsCount,
  );

  static CommentModel toUiCommentState(CommentEntity entity) => CommentModel(
    idComment: entity.id.toString(),
    idCommenter: entity.commenterEmail,
    dateComment: formatDate(entity.createdAt),
    commenterImage: '',
    commentMassage: entity.comment,
    commenterName: entity.commenterEmail,
    commenterPosition: entity.commenterRole,
  );
}