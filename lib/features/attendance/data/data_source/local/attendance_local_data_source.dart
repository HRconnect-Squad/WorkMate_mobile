import '../../../domain/entity/UserInfo.dart';

abstract class AttendanceLocalDataSource {
  Future<UserInfo?> getCachedUserInfo();
}