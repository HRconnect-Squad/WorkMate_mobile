import '../../../../core/presentation/base_viewmodel/base_cubit.dart';
import '../../../../core/presentation/design_system/components/custom_status_bar.dart';
import '../../domain/use_cases/get_tasks_use_case.dart';
import '../mapper/task_mapper.dart';
import 'task_state.dart';

class TaskCubit extends BaseCubit<TaskState> {
  final GetTasksUseCase _getTasksUseCase;

  TaskCubit(this._getTasksUseCase) : super(const TaskState()) {
    loadTasks();
  }

  Future<void> loadTasks() async {
    await execute(
      onLoading: () =>
          updateState((s) => s.copyWith(isLoading: true, clearApiError: true)),
      call: () => _getTasksUseCase(),
      onSuccess: (tasks) {
        updateState(
              (s) => s.copyWith(
            isLoading: false,
            isSuccess: true,
            tasks: tasks.map(TaskMapper.toUiTaskState).toList(),
          ),
        );
      },
      onError: (failure) {
        updateState(
              (s) => s.copyWith(
            isLoading: false,
            apiError: failure.message,
            isSuccess: false,
          ),
        );
      },
    );
  }

  void onStatusChanged(TaskStatusEnum status) {
    updateState((s) => s.copyWith(selectedStatus: status));
  }

  Future<void> refresh() => loadTasks();
}