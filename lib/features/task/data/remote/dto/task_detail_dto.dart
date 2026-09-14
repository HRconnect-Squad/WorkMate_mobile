import 'assigned_user_dto.dart';
import 'comment_dto.dart';

class TaskDetailDto {
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
  final List<CommentDto> comments;
  final List<dynamic> attachments;
  final String createdAt;
  final String updatedAt;

  const TaskDetailDto({
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
    required this.comments,
    required this.attachments,
    required this.createdAt,
    required this.updatedAt,
  });

  factory TaskDetailDto.fromJson(Map<String, dynamic> json) => TaskDetailDto(
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
    comments: (json['comments'] as List<dynamic>)
        .map((e) => CommentDto.fromJson(e as Map<String, dynamic>))
        .toList(),
    attachments: json['attachments'] as List<dynamic>,
    createdAt: json['created_at'] as String,
    updatedAt: json['updated_at'] as String,
  );
}