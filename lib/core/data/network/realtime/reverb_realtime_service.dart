import 'dart:async';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:pusher_channels_flutter/pusher_channels_flutter.dart';
import '../../../ services/logger_service.dart';
import '../../../config/app_config.dart';
import '../../../domain/service/realtime_service.dart';
import '../constant/api_constant.dart';
import '../dio_client.dart';

class ReverbRealtimeService implements RealtimeService {
  final DioClient _dioClient;
  final PusherChannelsFlutter _pusher = PusherChannelsFlutter.getInstance();
  final _events = StreamController<RealtimeEvent>.broadcast();
  final _status = StreamController<RealtimeConnectionStatus>.broadcast();
  bool _initialized = false;
  int? _userId;

  ReverbRealtimeService(this._dioClient);

  @override
  Stream<RealtimeEvent> get events => _events.stream;

  @override
  Stream<RealtimeConnectionStatus> get connectionStatus => _status.stream;

  @override
  Future<void> connect({required int userId}) async {
    if (_userId == userId) return;
    if (_userId != null) await disconnect();       // different user logged in
    _userId = userId;
    _status.add(RealtimeConnectionStatus.connecting);

    try {
      if (!_initialized) {
        await _pusher.init(
          apiKey: AppConfig.reverbAppKey,
          cluster: '',            // ⚠ verify host/port support in the spike
          useTLS: true,
          onConnectionStateChange: (current, _) => _status.add(_map(current)),
          onAuthorizer: (channel, socketId, _) => _authorize(channel, socketId),
          onEvent: _onEvent,
          onError: (message, code, error) => logger.e('Realtime error: $message'),
        );
        _initialized = true;
      }
      await _pusher.subscribe(channelName: 'private-users.$userId');
      await _pusher.connect();
    } catch (e, st) {
      logger.e('Realtime connect failed', error:  e, stackTrace:  st);
      _userId = null;
      _status.add(RealtimeConnectionStatus.failed);
    }
  }

  Future<Map<String, dynamic>> _authorize(String channel, String socketId) async {
    final response = await _dioClient.post(
      ApiConstants.realtimeAuthorize,
      data: {'socket_id': socketId, 'channel_name': channel},
      options: Options(contentType: Headers.formUrlEncodedContentType),
    );
    return Map<String, dynamic>.from(response.data as Map);
  }

  void _onEvent(PusherEvent event) {
    if (event.eventName.startsWith('pusher')) return; // protocol-internal events
    try {
      final raw = event.data;
      final decoded = raw is String ? jsonDecode(raw) : raw;
      _events.add(RealtimeEvent(
        name: event.eventName,
        data: Map<String, dynamic>.from(decoded as Map),
      ));
    } catch (e) {
      logger.e('Bad realtime payload for ${event.eventName}', error: e);
    }
  }

  RealtimeConnectionStatus _map(dynamic state) => switch (state.toString().toLowerCase()) {
    'connected'    => RealtimeConnectionStatus.connected,
    'connecting'   => RealtimeConnectionStatus.connecting,
    'reconnecting' => RealtimeConnectionStatus.reconnecting,
    _              => RealtimeConnectionStatus.disconnected,
  };

  @override
  Future<void> disconnect() async {
    final id = _userId;
    _userId = null;
    if (id != null) {
      try { await _pusher.unsubscribe(channelName: 'private-users.$id'); } catch (_) {}
    }
    try { await _pusher.disconnect(); } catch (_) {}
    _status.add(RealtimeConnectionStatus.disconnected);
  }
}