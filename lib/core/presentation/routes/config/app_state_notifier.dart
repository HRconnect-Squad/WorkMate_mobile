import 'package:flutter/foundation.dart';


class AuthStateNotifier extends ChangeNotifier {
  AuthStateNotifier._();

  static final AuthStateNotifier _instance = AuthStateNotifier._();
  static AuthStateNotifier get instance => _instance;

  bool _isLoggedIn = false;
  bool _isOnboardingCompleted = false;

  bool get isLoggedIn => _isLoggedIn;
  bool get isOnboardingCompleted => _isOnboardingCompleted;


  Future<void> initialize({
    required Future<bool> Function() checkIsLoggedIn,
    required bool Function() checkOnboardingCompleted,
  }) async {
    _isLoggedIn = await checkIsLoggedIn();
    _isOnboardingCompleted = checkOnboardingCompleted();
  }

  void setLoggedIn() {
    _isLoggedIn = true;
    notifyListeners();
  }

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