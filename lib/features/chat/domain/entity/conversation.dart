import 'package:equatable/equatable.dart';
import 'chat_contact.dart';
import 'message.dart';

class Conversation extends Equatable {
  final ChatContact contact;
  final Message lastMessage;
  final int unreadCount;

  const Conversation({
    required this.contact,
    required this.lastMessage,
    required this.unreadCount,
  });

  Conversation copyWith({Message? lastMessage, int? unreadCount}) {
    return Conversation(
      contact: contact,
      lastMessage: lastMessage ?? this.lastMessage,
      unreadCount: unreadCount ?? this.unreadCount,
    );
  }

  @override
  List<Object?> get props => [contact, lastMessage, unreadCount];
}