import 'package:equatable/equatable.dart';
import '../../../../core/presentation/design_system/components/custom_status_bar.dart';
import '../../../../core/presentation/design_system/model/task_model.dart';
import '../../../../core/presentation/design_system/model/task_status_enums.dart';

class TaskState extends Equatable {
  final List<TaskModel> tasks;
  final bool isLoading;
  final String? apiError;
  final TaskStatusEnum selectedStatus;
  final bool isSuccess;

  const TaskState({
    this.tasks = const [],
    this.isLoading = false,
    this.apiError,
    this.selectedStatus = TaskStatusEnum.all,
    this.isSuccess = false,
  });

  List<TaskModel> get filteredTasks {
    switch (selectedStatus) {
      case TaskStatusEnum.all:
        return tasks;
      case TaskStatusEnum.inProgress:
        return tasks.where((t) => t.status == TaskStatus.inProgress).toList();
      case TaskStatusEnum.finish:
        return tasks.where((t) => t.status == TaskStatus.done).toList();
    }
  }

  int get todoCount => tasks.where((t) => t.status == TaskStatus.review).length;
  int get inProgressCount => tasks.where((t) => t.status == TaskStatus.inProgress).length;
  int get doneCount => tasks.where((t) => t.status == TaskStatus.done).length;
  bool get isEmpty => tasks.isEmpty;

  TaskState copyWith({
    List<TaskModel>? tasks,
    bool? isLoading,
    String? apiError,
    TaskStatusEnum? selectedStatus,
    bool? isSuccess,
    bool clearApiError = false,
  }) {
    return TaskState(
      tasks: tasks ?? this.tasks,
      isLoading: isLoading ?? this.isLoading,
      apiError: clearApiError ? null : (apiError ?? this.apiError),
      selectedStatus: selectedStatus ?? this.selectedStatus,
      isSuccess: isSuccess ?? this.isSuccess,
    );
  }

  @override
  List<Object?> get props => [tasks, isLoading, apiError, selectedStatus, isSuccess];
}