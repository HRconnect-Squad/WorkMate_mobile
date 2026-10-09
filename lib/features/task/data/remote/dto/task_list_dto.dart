import 'task_dto.dart';

/// `GET /api/tasks` response: `data.tasks` + `meta.task_count`.
class TaskListDto {
  final List<TaskDto> tasks;
  final int taskCount;

  const TaskListDto({required this.tasks, required this.taskCount});
}
