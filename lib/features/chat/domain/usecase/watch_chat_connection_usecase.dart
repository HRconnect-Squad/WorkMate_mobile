import '../../../../core/domain/model/realtime_connection_status.dart';
import '../repository/chat_repository.dart';

class WatchChatConnectionUseCase {
  final ChatRepository _repository;
  const WatchChatConnectionUseCase(this._repository);

  Stream<RealtimeConnectionStatus> call() => _repository.watchConnectionStatus();
}