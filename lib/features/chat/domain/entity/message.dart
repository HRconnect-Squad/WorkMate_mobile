import 'package:equatable/equatable.dart';

class Message extends Equatable {
  final int id;
  final String text;
  final int senderId;
  final int receiverId;
  final bool isRead;
  final DateTime createdAt;

  const Message({
    required this.id,
    required this.text,
    required this.senderId,
    required this.receiverId,
    required this.isRead,
    required this.createdAt,
  });

  bool isFrom(int userId) => senderId == userId;

  @override
  List<Object?> get props => [id, text, senderId, receiverId, isRead, createdAt];
}