import '../repository/chat_repository.dart';

class WatchChatConnectedUseCase {
  final ChatRepository _repository;
  const WatchChatConnectedUseCase(this._repository);

  Stream<void> call() => _repository.watchConnected();
}