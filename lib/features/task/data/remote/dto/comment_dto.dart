class CommentDto {
  final int id;
  final String comment;
  final CommentUserDto user;
  final String? image;
  final String createdAt;

  const CommentDto({
    required this.id,
    required this.comment,
    required this.user,
    this.image,
    required this.createdAt,
  });

  factory CommentDto.fromJson(Map<String, dynamic> json) => CommentDto(
    id: json['id'] as int,
    comment: json['comment'] as String,
    user: CommentUserDto.fromJson(json['user'] as Map<String, dynamic>),
    image: json['image'] as String?,
    createdAt: json['created_at'] as String,
  );
}

class CommentUserDto {
  final int id;
  final String email;
  final String role;

  const CommentUserDto({
    required this.id,
    required this.email,
    required this.role,
  });

  factory CommentUserDto.fromJson(Map<String, dynamic> json) => CommentUserDto(
    id: json['id'] as int,
    email: json['email'] as String,
    role: json['role'] as String,
  );
}