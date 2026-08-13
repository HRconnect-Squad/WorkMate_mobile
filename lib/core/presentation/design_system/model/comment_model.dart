import 'package:equatable/equatable.dart';

class CommentModel extends Equatable {
  final String idComment;
  final String idCommenter;
  final String dateComment;
  final String commenterImage;
  final String commentMassage;
  final String? commenterName;
  final String? commenterPosition;

  const CommentModel({
    required this.idComment,
    required this.idCommenter,
    required this.dateComment,
    required this.commenterImage,
    required this.commentMassage,
    this.commenterName,
    this.commenterPosition,
  });

  @override
  List<Object?> get props => [
    idComment,
    idCommenter,
    dateComment,
    commenterImage,
    commentMassage,
    commenterName,
    commenterPosition,
  ];
}