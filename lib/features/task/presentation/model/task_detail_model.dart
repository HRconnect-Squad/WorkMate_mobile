import 'package:equatable/equatable.dart';

import '../../../../core/presentation/design_system/model/comment_model.dart';
import '../../../../core/presentation/design_system/model/task_model.dart';

class TaskDetailModel extends Equatable {
  final TaskModel task;
  final String description;
  final List<String> imageUrls;
  final String assigneeName;
  final String assigneeJobTitle;
  final String assigneeAvatarUrl;
  final String difficulty;
  final List<CommentModel> comments;

  const TaskDetailModel({
    required this.task,
    required this.description,
    required this.imageUrls,
    required this.assigneeName,
    required this.assigneeJobTitle,
    required this.assigneeAvatarUrl,
    required this.difficulty,
    this.comments = const [],
  });

  TaskDetailModel copyWith({
    TaskModel? task,
    String? description,
    List<String>? imageUrls,
    String? assigneeName,
    String? assigneeJobTitle,
    String? assigneeAvatarUrl,
    String? difficulty,
    List<CommentModel>? comments,
  }) {
    return TaskDetailModel(
      task: task ?? this.task,
      description: description ?? this.description,
      imageUrls: imageUrls ?? this.imageUrls,
      assigneeName: assigneeName ?? this.assigneeName,
      assigneeJobTitle: assigneeJobTitle ?? this.assigneeJobTitle,
      assigneeAvatarUrl: assigneeAvatarUrl ?? this.assigneeAvatarUrl,
      difficulty: difficulty ?? this.difficulty,
      comments: comments ?? this.comments,
    );
  }

  @override
  List<Object?> get props => [
    task,
    description,
    imageUrls,
    assigneeName,
    assigneeJobTitle,
    assigneeAvatarUrl,
    difficulty,
    comments,
  ];
}