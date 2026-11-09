import '../../../../../../core/domain/model/realtime_connection_status.dart';
import '../dto/message_dto.dart';

abstract class ChatRealtimeDataSource {
  Stream<MessageDto> watchIncomingMessages();

  Stream<RealtimeConnectionStatus> watchConnectionStatus();

  Stream<void> watchConnected();
}