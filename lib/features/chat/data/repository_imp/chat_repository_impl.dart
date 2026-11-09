import 'package:fpdart/fpdart.dart';
import '../../../../core/data/exception/app_exception.dart';
import '../../../../core/data/network/helper/safe_api_call.dart';
import '../../../../core/data/util/stream_extensions.dart';
import '../../../../core/domain/failure/domain_failure.dart';
import '../../../../core/domain/model/paged_result.dart';
import '../../../../core/domain/model/realtime_connection_status.dart';
import '../../domain/entity/conversation.dart';
import '../../domain/entity/message.dart';
import '../../domain/repository/chat_repository.dart';
import '../datasource/remote/chat_remote_data_source.dart';
import '../datasource/remote/dto/request/send_message_request_dto.dart';
import '../datasource/remote/realtime/chat_realtime_data_source.dart';
import '../mapper/chat_mapper.dart';

class ChatRepositoryImpl with SafeApiCall implements ChatRepository {
  final ChatRemoteDataSource _remoteDataSource;
  final ChatRealtimeDataSource _realtimeDataSource;

  const ChatRepositoryImpl({
    required ChatRemoteDataSource remoteDataSource,
    required ChatRealtimeDataSource realtimeDataSource,
  })  : _remoteDataSource = remoteDataSource,
        _realtimeDataSource = realtimeDataSource;

  @override
  Future<Either<Failure, PagedResult<Conversation>>> getConversations({
    int page = 1,
  }) =>
      safeApiCall(
        call: () async {
          final response = await _remoteDataSource.getConversations(page: page);
          return ChatMapper.toConversationsPage(response);
        },
      );

  @override
  Future<Either<Failure, PagedResult<Message>>> getConversationMessages({
    required int contactId,
    int page = 1,
  }) =>
      safeApiCall(
        call: () async {
          final response = await _remoteDataSource.getConversationMessages(
            contactId: contactId,
            page: page,
          );
          return ChatMapper.toMessagesPage(response);
        },
      );

  @override
  Future<Either<Failure, Message>> sendMessage({
    required int receiverId,
    required String text,
  }) =>
      safeApiCall(
        call: () async {
          final dto = await _remoteDataSource.sendMessage(
            SendMessageRequestDto(receiverId: receiverId, message: text),
          );
          final message = ChatMapper.toMessage(dto);
          if (message == null) {
            throw const SerializationException(
              message: 'Invalid message in server response',
            );
          }
          return message;
        },
      );

  @override
  Future<Either<Failure, Unit>> markConversationRead(int contactId) =>
      safeApiCall(
        call: () async {
          await _remoteDataSource.markConversationRead(contactId);
          return unit;
        },
      );

  @override
  Stream<Message> watchIncomingMessages() => _realtimeDataSource
      .watchIncomingMessages()
      .map(ChatMapper.toMessage)
      .whereNotNull();

  @override
  Stream<RealtimeConnectionStatus> watchConnectionStatus() =>
      _realtimeDataSource.watchConnectionStatus();

  @override
  Stream<void> watchConnected() => _realtimeDataSource.watchConnected();
}