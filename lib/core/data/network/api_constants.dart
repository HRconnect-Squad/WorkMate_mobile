class ApiConstants {
  ApiConstants._();

  static const String contentType = 'application/json';
  static const String accept = 'application/json';
  static const String apiKeyHeader = 'x-api-key';
  static const String authorizationHeader = 'Authorization';

  static const String register = '/api/auth/register';
  static const String verifyOtp = '/api/auth/verify-otp';
  static const String login = '/api/auth/login';
  static const String forgotPassword = '/api/auth/forgot-password';
  static const String verifyForgotPasswordOtp = '/api/auth/verify-forgot-password-otp';

  static const String logout = '/api/auth/logout';
  static const String logoutAll = '/api/auth/logout-all';
  static const String deleteAccount = '/api/auth/delete-account';
  static const String currentUser = '/api/user';

  static const String tokenKey = 'token';
  static const String multipartContentType = 'multipart/form-data';

  static const String getProfile = '/api/profile';
  static const String changePassword = '/api/auth/change-password';
  static const String completeProfile = '/api/profile/complete';
  static const String updateProfile = '/api/profile';
  static const String uploadProfileImage = '/api/uploads/profile-image';
  static const String getOfficeAssets = '/api/assets/my';
  static const String getPayrollHistory = '/api/payroll';
  //static const String getPayrollDetail = '/api/payroll';

  static const String expenses = '/api/expenses';
  static const String uploadReceipt= '/api/uploads/receipt';
}
