import 'package:fpdart/fpdart.dart';
import '../../../../core/data/network/helper/safe_api_call.dart';
import '../../../../core/domain/failure/domain_failure.dart';
import '../../domain/entity/meeting.dart';
import '../../domain/repository/home_repository.dart';
import '../mapper/meeting_mapper.dart';
import '../remote/home_remote_data_source.dart';

class HomeRepositoryImpl with SafeApiCall implements HomeRepository {
  final HomeRemoteDataSource _remote;

  const HomeRepositoryImpl({required HomeRemoteDataSource remote})
      : _remote = remote;

  @override
  Future<Either<Failure, int>> getUnreadMessagesCount() =>
      safeApiCall(call: _remote.getUnreadMessagesCount);

  @override
  Future<Either<Failure, int>> getUnreadNotificationsCount() =>
      safeApiCall(call: _remote.getUnreadNotificationsCount);

  @override
  Future<Either<Failure, List<Meeting>>> getTodayMeetings() => safeApiCall(
    call: () async {
      final dtos = await _remote.getTodayMeetings();
      return dtos.map(MeetingMapper.toDomain).toList();
    },
  );
}
