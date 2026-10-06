import 'task_entity.dart';

class TaskListEntity {
  final List<TaskEntity> tasks;
  final int taskCount;

  const TaskListEntity({required this.tasks, required this.taskCount});
}
