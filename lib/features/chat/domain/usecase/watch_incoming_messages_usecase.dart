import '../entity/message.dart';
import '../repository/chat_repository.dart';

class WatchIncomingMessagesUseCase {
  final ChatRepository _repository;
  const WatchIncomingMessagesUseCase(this._repository);

  Stream<Message> call() => _repository.watchIncomingMessages();
}