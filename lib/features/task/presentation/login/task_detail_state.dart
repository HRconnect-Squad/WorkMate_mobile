import 'package:equatable/equatable.dart';
import '../model/task_detail_model.dart';

class TaskDetailState extends Equatable {
  final TaskDetailModel? taskDetail;
  final bool isLoading;
  final String? apiError;
  final bool isSuccess;
  final bool isSubmittingComment;
  final String? commentError;

  const TaskDetailState({
    this.taskDetail,
    this.isLoading = false,
    this.apiError,
    this.isSuccess = false,
    this.isSubmittingComment = false,
    this.commentError,
  });

  TaskDetailState copyWith({
    TaskDetailModel? taskDetail,
    bool? isLoading,
    String? apiError,
    bool? isSuccess,
    bool? isSubmittingComment,
    String? commentError,
    bool clearApiError = false,
    bool clearCommentError = false,
  }) {
    return TaskDetailState(
      taskDetail: taskDetail ?? this.taskDetail,
      isLoading: isLoading ?? this.isLoading,
      apiError: clearApiError ? null : (apiError ?? this.apiError),
      isSuccess: isSuccess ?? this.isSuccess,
      isSubmittingComment: isSubmittingComment ?? this.isSubmittingComment,
      commentError: clearCommentError ? null : (commentError ?? this.commentError),
    );
  }

  @override
  List<Object?> get props => [
    taskDetail,
    isLoading,
    apiError,
    isSuccess,
    isSubmittingComment,
    commentError,
  ];
}