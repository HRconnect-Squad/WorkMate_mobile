class LeaveApiConstant {
  const LeaveApiConstant._();

  static const String getLeaveTypes = '/api/leaves/types';
  static String leaveDetail(int id) => '/api/leaves/$id';
  static const String getLeaveRequests = '/api/leaves';
  static const String deleteLeaveRequest = '/api/leaves/';
  static const String createLeaveRequest = '/api/leaves';
  static const String getLeaveBalance = '/api/leaves/balance';

}