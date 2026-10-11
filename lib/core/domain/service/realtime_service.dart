enum RealtimeConnectionStatus { disconnected, connecting, connected, reconnecting, failed }

class RealtimeEvent {
  final String name;
  final Map<String, dynamic> data;
  const RealtimeEvent({required this.name, required this.data});
}

abstract class RealtimeService {
  Stream<RealtimeConnectionStatus> get connectionStatus;
  Stream<RealtimeEvent> get events;
  Future<void> connect({required int userId});
  Future<void> disconnect();
}