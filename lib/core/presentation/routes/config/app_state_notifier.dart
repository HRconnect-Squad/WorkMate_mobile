import 'dart:async';

import 'package:flutter/foundation.dart';
import '../../../domain/service/session_state.dart';

class AuthStateNotifier extends ChangeNotifier implements SessionState {
  AuthStateNotifier._();

  static final AuthStateNotifier _instance = AuthStateNotifier._();
  static AuthStateNotifier get instance => _instance;

  final StreamController<bool> _loggedInController = StreamController<bool>.broadcast();

  bool _isLoggedIn = false;
  bool _isOnboardingCompleted = false;
  bool _isInitialized = false;

  @override
  bool get isLoggedIn => _isLoggedIn;
  bool get isOnboardingCompleted => _isOnboardingCompleted;
  @override
  bool get isInitialized => _isInitialized;
  @override
  Stream<bool> get loggedInChanges => _loggedInController.stream;

  Future<void> initialize({
    required Future<bool> Function() checkIsLoggedIn,
    required bool Function() checkOnboardingCompleted,
  }) async {
    final loggedIn = await checkIsLoggedIn();
    _isOnboardingCompleted = checkOnboardingCompleted();
    _isInitialized = true;       // must be set BEFORE emitting, so listeners see a consistent state
    _updateLoggedIn(loggedIn);
    notifyListeners();
  }

  void setLoggedIn() {
    _updateLoggedIn(true);
    notifyListeners();
  }

  @override
  void setLoggedOut() {
    _updateLoggedIn(false);
    notifyListeners();
  }

  void setOnboardingCompleted() {
    _isOnboardingCompleted = true;
    notifyListeners();
  }

  void reset() {
    _updateLoggedIn(false);
    _isOnboardingCompleted = false;
    notifyListeners();
  }

  void _updateLoggedIn(bool value) {
    if (_isLoggedIn == value) return;
    _isLoggedIn = value;
    _loggedInController.add(value);
  }
}