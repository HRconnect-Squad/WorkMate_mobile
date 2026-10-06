class TaskAssigneeDto {
  final int id;
  final String? name;
  final String? avatarUrl;

  const TaskAssigneeDto({required this.id, this.name, this.avatarUrl});

  factory TaskAssigneeDto.fromJson(Map<String, dynamic> json) =>
      TaskAssigneeDto(
        id: json['id'] as int? ?? 0,
        name: (json['full_name'] ?? json['name']) as String?,
        avatarUrl: (json['avatar_url'] ?? json['profile_image']) as String?,
      );
}
