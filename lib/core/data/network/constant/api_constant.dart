class ApiConstants {
  const ApiConstants._();

  static const String contentTypeHeaderKey = 'Content-Type';
  static const String contentTypeHeaderValue = 'application/json';
  static const String acceptanceHeaderKey = 'Accept';
  static const String apiHeaderKey = 'x-api-key';
  static const String acceptanceHeaderValue = 'application/json';
  static const String authorizationHeaderKey = 'Authorization';
  static const String authorizationHeaderValue = 'Bearer';

  static const String multipartContentType = 'multipart/form-data';
  static const String acceptLanguage = 'Accept-Language';
  static const String localDataTokenKey = 'token';


  static const String attendanceHistory = '/api/attendance/history';
  static const String attendanceCheckIn = '/api/attendance/check-in';
  static const String attendanceCheckOut = '/api/attendance/check-out';
  static const String attendanceToday = '/api/attendance/today';
  static const String startAttendanceBreak = '/api/attendance/break/start';
  static const String endAttendanceBreak = '/api/attendance/break/end';
  static String attendanceDetails(String id) => '/api/attendance/$id/details';

}