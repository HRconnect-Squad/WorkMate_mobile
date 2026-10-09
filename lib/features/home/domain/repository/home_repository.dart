import 'package:fpdart/fpdart.dart';
import '../../../../core/domain/failure/domain_failure.dart';
import '../entity/meeting.dart';

abstract class HomeRepository {
  Future<Either<Failure, int>> getUnreadMessagesCount();
  Future<Either<Failure, int>> getUnreadNotificationsCount();
  Future<Either<Failure, List<Meeting>>> getTodayMeetings();
}
