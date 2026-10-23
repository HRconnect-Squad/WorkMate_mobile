import 'dart:async';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:pusher_channels_flutter/pusher_channels_flutter.dart';
import 'package:workmate/core/%20services/logger_service.dart';
import '../../config/app_config.dart';
import '../../domain/model/realtime_connection_status.dart';
import '../exception/app_exception.dart';
import 'constant/realtime_api_constant.dart';
import 'dio_client.dart';
import 'dto/realtime/socket_event.dart';

class SocketClient {
  final DioClient _dioClient;
  final PusherChannelsFlutter _pusher = PusherChannelsFlutter.getInstance();
  final _events = StreamController<SocketEvent>.broadcast();
  final _status = StreamController<RealtimeConnectionStatus>.broadcast();
  final _errors = StreamController<AppException>.broadcast();

  Future<void> _tail = Future.value();
  RealtimeConnectionStatus _currentStatus = RealtimeConnectionStatus.disconnected;
  bool _initialized = false;
  bool _disposed = false;
  int? _userId;

  SocketClient(this._dioClient);

  Stream<SocketEvent> get events => _events.stream;
  Stream<RealtimeConnectionStatus> get connectionStatus => _status.stream;
  Stream<AppException> get errors => _errors.stream;
  RealtimeConnectionStatus get currentStatus => _currentStatus;

  Future<void> connect({required int userId}) =>
      _enqueue(() => _connect(userId));

  Future<void> disconnect() => _enqueue(_disconnect);

  Future<void> dispose() async {
    if (_disposed) return;
    _disposed = true;
    await disconnect();
    await _events.close();
    await _status.close();
    await _errors.close();
  }

  Future<T> _enqueue<T>(Future<T> Function() operation) {
    final result = _tail.then((_) => operation());
    _tail = result.then<void>((_) {}, onError: (_) {});
    return result;
  }

  Future<void> _connect(int userId) async {
    if (_disposed) {
      throw const UnknownException(message: 'Socket client has been disposed');
    }
    if (_userId == userId) return;
    if (_userId != null) await _disconnect(); // a different user was connected

    _emitStatus(RealtimeConnectionStatus.connecting);

    try {
      if (!_initialized) {
        await _pusher.init(
          apiKey: AppConfig.reverbAppKey,
          cluster: '', // ⚠ confirm host/port support in the spike
          useTLS: true,
          onConnectionStateChange: (current, previous) =>
              _emitStatus(_mapStatus(current)),
          onAuthorizer: (channelName, socketId, options) =>
              _authorize(channelName, socketId),
          onEvent: _onEvent,
          onSubscriptionError: (message, error) => _emitError(
            UnknownException(message: 'Subscription failed: $message'),
          ),
          onError: (message, code, error) =>
              _emitError(NetworkException(message: '$message')),
        );
        _initialized = true;
      }

      await _pusher.subscribe(channelName: _channelFor(userId));
      await _pusher.connect();

      _userId = userId;
    } catch (e, st) {
      logger.e('Socket connect failed',error:  e, stackTrace: st);
      await _teardown(userId);
      _emitStatus(RealtimeConnectionStatus.failed);
      if (e is AppException) rethrow;
      throw const NetworkException(
        message: 'Could not connect to the real-time server',
      );
    }
  }

  Future<void> _disconnect() async {
    final id = _userId;
    _userId = null;
    await _teardown(id);
    _emitStatus(RealtimeConnectionStatus.disconnected);
  }

  Future<void> _teardown(int? userId) async {
    if (userId != null) {
      try {
        await _pusher.unsubscribe(channelName: _channelFor(userId));
      } catch (_) {}
    }
    try {
      await _pusher.disconnect();
    } catch (_) {}
  }

  Future<Map<String, dynamic>> _authorize(
      String channelName,
      String socketId,
      ) async {
    try {
      final response = await _dioClient.post(
        RealtimeApiConstant.realtimeAuthorize,
        data: {'socket_id': socketId, 'channel_name': channelName},
        options: Options(contentType: Headers.formUrlEncodedContentType),
      );
      return Map<String, dynamic>.from(response.data as Map);
    } on AppException catch (e) {
      _emitError(e);
      rethrow; // the plugin must know the authorization failed
    }
  }

  void _onEvent(PusherEvent event) {
    if (event.eventName.startsWith('pusher')) return;
    try {
      final raw = event.data;
      final decoded = raw is String ? jsonDecode(raw) : raw;
      _emitEvent(SocketEvent(
        name: event.eventName,
        data: Map<String, dynamic>.from(decoded as Map),
      ));
    } catch (e) {
      logger.e('Dropped malformed socket event ${event.eventName}', error: e);
    }
  }

  void _emitStatus(RealtimeConnectionStatus status) {
    _currentStatus = status;
    if (!_status.isClosed) _status.add(status);
  }

  void _emitError(AppException error) {
    if (!_errors.isClosed) _errors.add(error);
  }

  void _emitEvent(SocketEvent event) {
    if (!_events.isClosed) _events.add(event);
  }

  RealtimeConnectionStatus _mapStatus(dynamic state) =>
      switch (state.toString().toLowerCase()) {
        'connected' => RealtimeConnectionStatus.connected,
        'connecting' => RealtimeConnectionStatus.connecting,
        'reconnecting' => RealtimeConnectionStatus.reconnecting,
        _ => RealtimeConnectionStatus.disconnected,
      };

  String _channelFor(int userId) => 'private-users.$userId';
}