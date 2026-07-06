import 'package:workmate/core/presentation/design_system/model/task_priority_enums.dart';
import 'package:workmate/core/presentation/design_system/model/task_status_enums.dart';

import 'comment_model.dart';

class TaskModel{
  final String title;
  final TaskPriority priority;
  final TaskStatus status;
  final String date;
  final List<CommentModel> comments;

  const TaskModel({
    required this.title,
    required this.priority,
    required this.status,
    required this.date,
    required this.comments,
  });
}