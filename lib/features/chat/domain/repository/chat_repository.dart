import 'package:fpdart/fpdart.dart';

import '../../../../core/domain/failure/domain_failure.dart';
import '../../../../core/domain/model/paged_result.dart';
import '../../../../core/domain/model/realtime_connection_status.dart';
import '../entity/conversation.dart';
import '../entity/message.dart';

abstract class ChatRepository {
  Future<Either<Failure, PagedResult<Conversation>>> getConversations({
    int page = 1,
  });

  Future<Either<Failure, PagedResult<Message>>> getConversationMessages({
    required int contactId,
    int page = 1,
  });

  Future<Either<Failure, Message>> sendMessage({
    required int receiverId,
    required String text,
  });

  Future<Either<Failure, Unit>> markConversationRead(int contactId);

  Stream<Message> watchIncomingMessages();
  Stream<RealtimeConnectionStatus> watchConnectionStatus();

  Stream<void> watchConnected();
}