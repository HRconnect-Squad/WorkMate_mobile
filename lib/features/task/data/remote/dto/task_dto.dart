
import 'assigned_user_dto.dart';

class TaskDto {
  final int id;
  final String title;
  final String? description;
  final String? startDate;
  final String? dueDate;
  final String priority;
  final String status;
  final int progressPercentage;
  final AssignedUserDto? assignedTo;
  final AssignedUserDto? createdBy;
  final int commentsCount;
  final int attachmentsCount;
  final String createdAt;
  final String updatedAt;
  final List<TaskCommentAvatarDto> comments;

  const TaskDto({
    required this.id,
    required this.title,
    this.description,
    this.startDate,
    this.dueDate,
    required this.priority,
    required this.status,
    required this.progressPercentage,
    this.assignedTo,
    this.createdBy,
    required this.commentsCount,
    required this.attachmentsCount,
    required this.createdAt,
    required this.updatedAt,
    this.comments = const [],
  });

  factory TaskDto.fromJson(Map<String, dynamic> json) => TaskDto(
    id: json['id'] as int,
    title: json['title'] as String,
    description: json['description'] as String?,
    startDate: json['start_date'] as String?,
    dueDate: json['due_date'] as String?,
    priority: json['priority'] as String,
    status: json['status'] as String,
    progressPercentage: json['progress_percentage'] as int,
    assignedTo: json['assigned_to'] == null
        ? null
        : AssignedUserDto.fromJson(json['assigned_to']),
    createdBy: json['created_by'] == null
        ? null
        : AssignedUserDto.fromJson(json['created_by']),
    commentsCount: json['comments_count'] as int,
    attachmentsCount: json['attachments_count'] as int,
    createdAt: json['created_at'] as String,
    updatedAt: json['updated_at'] as String,
    comments: (json['comments'] as List<dynamic>? ?? [])
        .map((e) => TaskCommentAvatarDto.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}
class TaskCommentAvatarDto {
  final int userId;
  final String name;
  final String? profileImage;

  const TaskCommentAvatarDto({
    required this.userId,
    required this.name,
    this.profileImage,
  });

  factory TaskCommentAvatarDto.fromJson(Map<String, dynamic> json) =>
      TaskCommentAvatarDto(
        userId: json['user_id'] as int,
        name: json['name'] as String,
        profileImage: json['profile_image'] as String?,
      );
}