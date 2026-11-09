import 'package:workmate/core/%20services/logger_service.dart';
import '../../../../../../core/data/network/dto/realtime/socket_event.dart';
import '../../../../../../core/data/network/socket_client.dart';
import '../../../../../../core/data/util/stream_extensions.dart';
import '../../../../../../core/domain/model/realtime_connection_status.dart';
import '../dto/message_dto.dart';
import 'chat_realtime_data_source.dart';

class ChatRealtimeDataSourceImpl implements ChatRealtimeDataSource {
  static const String _messageSentEvent = 'message.sent';

  final SocketClient _socket;

  const ChatRealtimeDataSourceImpl({required SocketClient socket})
      : _socket = socket;

  @override
  Stream<MessageDto> watchIncomingMessages() => _socket.events
      .where((event) => event.name == _messageSentEvent)
      .map(_parse)
      .whereNotNull();

  @override
  Stream<RealtimeConnectionStatus> watchConnectionStatus() async* {

    yield _socket.currentStatus;
    yield* _socket.connectionStatus;
  }

  @override
  Stream<void> watchConnected() => _socket.onConnected;

  MessageDto? _parse(SocketEvent event) {
    try {
      final dto = MessageDto.fromJson(
        event.data['message'] as Map<String, dynamic>,
      );
      return dto.id == null ? null : dto;
    } catch (e) {
      logger.e('Dropped malformed message.sent payload', error: e);
      return null;
    }
  }
}