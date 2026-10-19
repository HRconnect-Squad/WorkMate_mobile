import 'dart:async';
import 'package:fpdart/fpdart.dart';

import '../ services/logger_service.dart';
import '../data/exception/app_exception.dart';
import '../data/network/socket_client.dart';
import '../domain/failure/domain_failure.dart';
import '../presentation/routes/config/app_state_notifier.dart';


typedef UserIdProvider = Future<Either<Failure, int>> Function();


class RealtimeSessionBinder {
  final SocketClient _socket;
  final AuthStateNotifier _session;
  final UserIdProvider _getUserId;

  late final StreamSubscription<AppException> _errorSub;
  bool? _lastLoggedIn;

  RealtimeSessionBinder({
    required SocketClient socket,
    required AuthStateNotifier session,
    required UserIdProvider getUserId,
  })  : _socket = socket,
        _session = session,
        _getUserId = getUserId
  {
    _session.addListener(_onSessionChanged);
    _errorSub = _socket.errors.listen(_onSocketError);
    _onSessionChanged();
  }

  void _onSessionChanged() {
    if (!_session.isInitialized) return;

    final loggedIn = _session.isLoggedIn;
    if (loggedIn == _lastLoggedIn) return; // unrelated notification (e.g. onboarding)
    _lastLoggedIn = loggedIn;

    _sync(loggedIn);
  }

  Future<void> _sync(bool loggedIn) async {
    if (!loggedIn) {
      await _socket.disconnect();
      return;
    }

    final idResult = await _getUserId();
    await idResult.fold(
          (failure) async {
        logger.w('Socket not started: no user id (${failure.message})');
        _lastLoggedIn = null; // allow a later notification to retry
      },
          (userId) async {
        if (!_session.isLoggedIn) return; // logged out while we were awaiting
        try {
          await _socket.connect(userId: userId);
        } on AppException catch (e) {
          logger.e('Socket connect failed: ${e.message}');
        }
      },
    );
  }

  void _onSocketError(AppException error) {
    logger.w('Socket error: ${error.message}');
    // A 401 on the auth handshake means the token is no longer valid.
    if (error is UnauthorizedException && _session.isLoggedIn) {
      _session.setLoggedOut();
    }
  }

  void dispose() {
    _session.removeListener(_onSessionChanged);
    _errorSub.cancel();
  }
}