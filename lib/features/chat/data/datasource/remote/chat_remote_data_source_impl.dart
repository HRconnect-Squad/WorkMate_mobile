import '../../../../../core/data/network/dio_client.dart';
import '../../../../../core/data/network/dto/response/api_response.dart';
import '../../constant/chat_api_constant.dart';
import 'chat_remote_data_source.dart';
import 'dto/conversation_dto.dart';
import 'dto/message_dto.dart';
import 'dto/request/send_message_request_dto.dart';

class ChatRemoteDataSourceImpl implements ChatRemoteDataSource {
  final DioClient _dioClient;

  const ChatRemoteDataSourceImpl({required DioClient dioClient})
      : _dioClient = dioClient;

  @override
  Future<PagedResponse<ConversationDto>> getConversations({int page = 1}) async {
    final response = await _dioClient.get(
      ChatApiConstant.conversations,
      queryParameters: {'page': page},
    );

    final apiResponse = ApiResponse.fromJson(
      response.data,
          (data) => (data as List<dynamic>)
          .map((item) => ConversationDto.fromJson(item as Map<String, dynamic>))
          .toList(),
    );

    return _toPaged(apiResponse);
  }

  @override
  Future<PagedResponse<MessageDto>> getConversationMessages({
    required int contactId,
    int page = 1,
  }) async {
    final response = await _dioClient.get(
      ChatApiConstant.conversationMessages(contactId),
      queryParameters: {'page': page},
    );

    final apiResponse = ApiResponse.fromJson(
      response.data,
          (data) => (data as List<dynamic>)
          .map((item) => MessageDto.fromJson(item as Map<String, dynamic>))
          .toList(),
    );

    return _toPaged(apiResponse);
  }

  @override
  Future<MessageDto> sendMessage(SendMessageRequestDto request) async {
    final response = await _dioClient.post(
      ChatApiConstant.sendMessage,
      data: request.toJson(),
    );

    final apiResponse = ApiResponse.fromJson(
      response.data,
          (data) => MessageDto.fromJson(data as Map<String, dynamic>),
    );

    return apiResponse.requiredData;
  }

  @override
  Future<void> markConversationRead(int contactId) async {
    await _dioClient.put(ChatApiConstant.conversationRead(contactId));
  }

  PagedResponse<E> _toPaged<E>(ApiResponse<List<E>> apiResponse) {
    final items = apiResponse.requiredData;
    return PagedResponse(
      items: items,
      pagination: apiResponse.pagination ?? Pagination.single(items.length),
    );
  }
}