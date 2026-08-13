class CommentEntity {
  final int id;
  final String comment;
  final String commenterEmail;
  final String commenterRole;
  final String createdAt;

  const CommentEntity({
    required this.id,
    required this.comment,
    required this.commenterEmail,
    required this.commenterRole,
    required this.createdAt,
  });
}