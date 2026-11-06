import '../../../../../../core/data/network/dto/response/api_response.dart';
import '../dto/conversation_dto.dart';
import '../dto/message_dto.dart';
import '../dto/request/send_message_request_dto.dart';

abstract class ChatRemoteDataSource {
  Future<PagedResponse<ConversationDto>> getConversations({int page = 1});

  Future<PagedResponse<MessageDto>> getConversationMessages({
    required int contactId,
    int page = 1,
  });

  Future<MessageDto> sendMessage(SendMessageRequestDto request);

  Future<void> markConversationRead(int contactId);
}