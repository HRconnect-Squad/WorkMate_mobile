import 'dto/meeting_dto.dart';

abstract class HomeRemoteDataSource {
  Future<int> getUnreadMessagesCount();
  Future<int> getUnreadNotificationsCount();
  Future<List<MeetingDto>> getTodayMeetings();
}
