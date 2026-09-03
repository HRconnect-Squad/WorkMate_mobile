import 'package:workmate/core/presentation/design_system/model/task_priority_enums.dart';
import 'package:workmate/core/presentation/design_system/model/task_status_enums.dart';
import 'package:equatable/equatable.dart';

class TaskModel extends Equatable {
  final int id;
  final String title;
  final TaskPriority priority;
  final TaskStatus status;
  final String date;
  final List<String?> commentAvatarUrls;
  final int commentsCount;

  const TaskModel({
    required this.id,
    required this.title,
    required this.priority,
    required this.status,
    required this.date,
    this.commentAvatarUrls = const [],
    this.commentsCount = 0,
  });

  @override
  List<Object?> get props => [
    id,
    title,
    priority,
    status,
    date,
    commentAvatarUrls,
    commentsCount,
  ];
}