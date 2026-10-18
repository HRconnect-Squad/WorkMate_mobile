abstract interface class SessionState {
  bool get isInitialized;
  bool get isLoggedIn;

  Stream<bool> get loggedInChanges;

  void setLoggedOut();
}