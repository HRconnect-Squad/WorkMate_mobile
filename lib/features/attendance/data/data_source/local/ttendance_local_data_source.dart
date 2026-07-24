import '../../../domain/enitity/UserInfo.dart';

abstract class AttendanceLocalDataSource {
  Future<UserInfo?> getCachedUserInfo();
}