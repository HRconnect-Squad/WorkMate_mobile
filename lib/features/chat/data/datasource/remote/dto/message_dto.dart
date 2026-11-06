import 'user_ref_dto.dart';

class MessageDto {
  final int? id;
  final String? message;
  final bool? isRead;
  final String? readAt;
  final String? createdAt;
  final UserRefDto? sender;
  final UserRefDto? receiver;

  const MessageDto({
    this.id,
    this.message,
    this.isRead,
    this.readAt,
    this.createdAt,
    this.sender,
    this.receiver,
  });

  factory MessageDto.fromJson(Map<String, dynamic> json) => MessageDto(
    id: json['id'] as int?,
    message: json['message'] as String?,
    isRead: json['is_read'] as bool?,
    readAt: json['read_at'] as String?,
    createdAt: json['created_at'] as String?,
    sender: json['sender'] is Map<String, dynamic>
        ? UserRefDto.fromJson(json['sender'] as Map<String, dynamic>)
        : null,
    receiver: json['receiver'] is Map<String, dynamic>
        ? UserRefDto.fromJson(json['receiver'] as Map<String, dynamic>)
        : null,
  );
}