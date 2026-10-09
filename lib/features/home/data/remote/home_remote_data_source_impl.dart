import '../../../../core/data/network/constant/api_constant.dart';
import '../../../../core/data/network/dio_client.dart';
import 'dto/meeting_dto.dart';
import 'home_remote_data_source.dart';

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final DioClient _dioClient;

  const HomeRemoteDataSourceImpl({required DioClient dioClient})
      : _dioClient = dioClient;

  @override
  Future<int> getUnreadMessagesCount() =>
      _getUnreadCount(ApiConstants.messagesInbox);

  @override
  Future<int> getUnreadNotificationsCount() =>
      _getUnreadCount(ApiConstants.notifications);

  @override
  Future<List<MeetingDto>> getTodayMeetings() async {
    final response = await _dioClient.get(ApiConstants.meetingsToday);
    final data = response.data['data'] as List<dynamic>;
    return data
        .map((e) => MeetingDto.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  Future<int> _getUnreadCount(String path) async {
    final response = await _dioClient.get(path);
    final data = response.data['data'] as Map<String, dynamic>;
    return data['unread_count'] as int? ?? 0;
  }
}
