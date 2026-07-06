class CommentModel{
  final String idComment;
  final String idCommenter;
  final String dateComment;
  final String commenterImage;
  final String commentMassage;




  const CommentModel({
    required this.idComment,
    required this.idCommenter,
    required this.dateComment,
    required this.commenterImage,
    required this.commentMassage
  });
}