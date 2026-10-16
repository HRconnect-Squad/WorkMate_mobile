import 'package:equatable/equatable.dart';

class Message extends Equatable {
  final int id;
  final String text;
  final int senderId;
  final int receiverId;
  final bool isRead;
  final DateTime createdAt;

  const Message({required this.id, required this.text, required this.senderId,
    required this.receiverId, required this.isRead, required this.createdAt});

  int peerIdFor(int myUserId) => senderId == myUserId ? receiverId : senderId;

  @override
  List<Object?> get props => [id, text, senderId, receiverId, isRead, createdAt];
}

// Every source (REST load, socket event, send response, resync) goes through this.
List<Message> mergeById(List<Message> current, Iterable<Message> incoming) {
  final byId = {for (final m in current) m.id: m};
  for (final m in incoming) { byId[m.id] = m; }
  return byId.values.toList()..sort((a, b) => a.createdAt.compareTo(b.createdAt));
}