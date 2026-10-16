import 'package:fpdart/fpdart.dart';

import '../../../../core/domain/failure/domain_failure.dart';
import '../entity/message.dart';

abstract class ChatRepository {
  Future<Either<Failure, List<Message>>> getInbox();
  Future<Either<Failure, List<Message>>> getSent();
  Future<Either<Failure, Message>> sendMessage({required int receiverId, required String text});
  Future<Either<Failure, Unit>> deleteMessage(int id);
  Stream<Message> watchIncomingMessages();
}