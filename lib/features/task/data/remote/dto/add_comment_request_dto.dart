class AddCommentRequestDto {
  final String comment;
  const AddCommentRequestDto({required this.comment});
  Map<String, dynamic> toJson() => {'comment': comment};
}