import '../../../../core/data/network/dto/response/api_response.dart';
import '../../../../core/data/util/parsing.dart';
import '../../../../core/domain/model/paged_result.dart';
import '../../domain/entity/chat_contact.dart';
import '../../domain/entity/conversation.dart';
import '../../domain/entity/message.dart';
import '../datasource/remote/dto/contact_dto.dart';
import '../datasource/remote/dto/conversation_dto.dart';
import '../datasource/remote/dto/message_dto.dart';

class ChatMapper {
  const ChatMapper._();

  static Message? toMessage(MessageDto dto) {
    final id = dto.id;
    final senderId = dto.sender?.id;
    final receiverId = dto.receiver?.id;
    ///note
    if (id == null || senderId == null || receiverId == null) return null;

    return Message(
      id: id,
      text: dto.message ?? '',
      senderId: senderId,
      receiverId: receiverId,
      isRead: dto.isRead ?? false,
      createdAt: DataFormat.parseDateTime(dto.createdAt) ?? DateTime.now(),
    );
  }

  static ChatContact? toContact(ContactDto dto) {
    final id = dto.id;
    if (id == null) return null;

    return ChatContact(
      id: id,
      fullName: dto.fullName ?? '',
      email: dto.email ?? '',
      phone: dto.phone,
      profileImage: dto.profileImage,
    );
  }

  static Conversation? toConversation(ConversationDto dto) {
    final contact = dto.contact == null ? null : toContact(dto.contact!);
    final lastMessage = dto.lastMessage == null ? null : toMessage(dto.lastMessage!);
    if (contact == null || lastMessage == null) return null;

    return Conversation(
      contact: contact,
      lastMessage: lastMessage,
      unreadCount: dto.unreadCount ?? 0,
    );
  }

  static PagedResult<Conversation> toConversationsPage(
      PagedResponse<ConversationDto> response,
      ) {
    return PagedResult(
      items: response.items.map(toConversation).whereType<Conversation>().toList(),
      currentPage: response.pagination.currentPage,
      lastPage: response.pagination.totalPages,
    );
  }

  static PagedResult<Message> toMessagesPage(PagedResponse<MessageDto> response) {
    return PagedResult(
      items: response.items.map(toMessage).whereType<Message>().toList(),
      currentPage: response.pagination.currentPage,
      lastPage: response.pagination.totalPages,
    );
  }
}