import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:workmate/core/domain/service/session_state.dart';

class AuthStateNotifier extends ChangeNotifier implements SessionState {
  AuthStateNotifier._();

  static final AuthStateNotifier _instance = AuthStateNotifier._();
  static AuthStateNotifier get instance => _instance;

  bool _isLoggedIn = false;
  bool _isOnboardingCompleted = false;
  bool _isInitialized = false;
  @override
  bool get isLoggedIn => _isLoggedIn;
  bool get isOnboardingCompleted => _isOnboardingCompleted;
  @override
  bool get isInitialized => _isInitialized;

  Future<void> initialize({
    required Future<bool> Function() checkIsLoggedIn,
    required bool Function() checkOnboardingCompleted,
  }) async {
    _isLoggedIn = await checkIsLoggedIn();
    _isOnboardingCompleted = checkOnboardingCompleted();
    _isInitialized = true;
    notifyListeners();
  }

  void setLoggedIn() {
    _isLoggedIn = true;
    notifyListeners();
  }

  @override
  void setLoggedOut() {
    _isLoggedIn = false;
    notifyListeners();
  }

  void setOnboardingCompleted() {
    _isOnboardingCompleted = true;
    notifyListeners();
  }

  void reset() {
    _isLoggedIn = false;
    _isOnboardingCompleted = false;
    notifyListeners();
  }
}