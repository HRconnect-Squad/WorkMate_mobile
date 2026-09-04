class AuthApiConstant {
  AuthApiConstant._();

  static const String register = '/api/auth/register';
  static const String verifyOtp = '/api/auth/verify-otp';
  static const String login = '/api/auth/login';
  static const String sendOtp = '/api/auth/send-otp';
  static const String checkForgotPasswordOtp = '/api/auth/check-forgot-password-otp';
  static const String forgotPassword = '/api/auth/forgot-password';
  static const String logout = '/api/auth/logout';
  static const String logoutAll = '/api/auth/logout-all';
  static const String deleteAccount = '/api/auth/delete-account';
  static const String changePassword = '/api/auth/change-password';
}