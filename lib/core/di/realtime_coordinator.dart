import '../domain/service/realtime_service.dart';
import '../presentation/routes/config/app_state_notifier.dart';

class RealtimeCoordinator {
  final RealtimeService _realtime;
  final AuthStateNotifier _auth;
  final Future<int?> Function() _loadUserId;

  RealtimeCoordinator(this._realtime, this._auth, this._loadUserId) {
    _auth.addListener(_sync);
    _sync();
  }

  Future<void> _sync() async {
    if (!_auth.isInitialized) return;
    if (_auth.isLoggedIn) {
      final id = await _loadUserId();
      if (id != null) await _realtime.connect(userId: id);
    } else {
      await _realtime.disconnect();
    }
  }
}