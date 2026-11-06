import 'contact_dto.dart';
import 'message_dto.dart';

class ConversationDto {
  final ContactDto? contact;
  final MessageDto? lastMessage;
  final int? unreadCount;

  const ConversationDto({this.contact, this.lastMessage, this.unreadCount});

  factory ConversationDto.fromJson(Map<String, dynamic> json) => ConversationDto(
    contact: json['contact'] is Map<String, dynamic>
        ? ContactDto.fromJson(json['contact'] as Map<String, dynamic>)
        : null,
    lastMessage: json['last_message'] is Map<String, dynamic>
        ? MessageDto.fromJson(json['last_message'] as Map<String, dynamic>)
        : null,
    unreadCount: json['unread_count'] as int?,
  );
}