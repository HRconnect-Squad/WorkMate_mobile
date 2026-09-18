import '../../../../core/presentation/base_viewmodel/base_cubit.dart';
import '../../domain/entity/task_detail_entity.dart';
import '../../domain/use_cases/add_comment_use_case.dart';
import '../../domain/use_cases/get_task_detail_use_case.dart';
import '../mapper/task_mapper.dart';
import '../model/task_detail_model.dart';
import 'task_detail_state.dart';

class TaskDetailCubit extends BaseCubit<TaskDetailState> {
  final GetTaskDetailUseCase _getTaskDetailUseCase;
  final AddCommentUseCase _addCommentUseCase;

  TaskDetailCubit(
      this._getTaskDetailUseCase,
      this._addCommentUseCase,
      int taskId,
      ) : super(const TaskDetailState()) {
    _loadDetail(taskId);
  }

  Future<void> _loadDetail(int taskId) async {
    await execute(
      onLoading: () => updateState(
            (s) => s.copyWith(isLoading: true, clearApiError: true),
      ),
      call: () => _getTaskDetailUseCase(taskId),
      onSuccess: (detail) {
        updateState(
              (s) => s.copyWith(
            isLoading: false,
            isSuccess: true,
            isSubmittingComment: false,
            taskDetail: _toPresentation(detail),
          ),
        );
      },
      onError: (failure) => updateState(
            (s) => s.copyWith(
          isLoading: false,
          isSubmittingComment: false,
          apiError: failure.message,
        ),
      ),
    );
  }

  Future<void> submitComment(int taskId, String comment) async {
    if (comment.trim().isEmpty) return;

    updateState((s) => s.copyWith(isSubmittingComment: true, clearCommentError: true));

    await execute(
      call: () => _addCommentUseCase(taskId, comment),
      onSuccess: (_) {
        _loadDetail(taskId);
      },
      onError: (failure) => updateState(
            (s) => s.copyWith(
          isSubmittingComment: false,
          commentError: failure.message,
        ),
      ),
    );
  }

  TaskDetailModel _toPresentation(TaskDetailEntity entity) => TaskDetailModel(
    task: TaskMapper.toUiTaskState(entity.task),
    description: entity.task.description ?? '',
    imageUrls: entity.attachmentUrls,
    assigneeName: entity.task.assigneeName ?? entity.task.assigneeEmail ?? '',
    assigneeJobTitle: '',
    assigneeAvatarUrl: '',
    difficulty: entity.task.priority.name,
    comments: entity.comments.map(TaskMapper.toUiCommentState).toList(),
  );
}