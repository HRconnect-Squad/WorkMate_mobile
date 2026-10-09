import 'package:fpdart/fpdart.dart';
import '../../../../core/domain/failure/domain_failure.dart';
import '../entity/meeting.dart';
import '../repository/home_repository.dart';

class GetTodayMeetingsUseCase {
  final HomeRepository _repository;
  const GetTodayMeetingsUseCase(this._repository);

  Future<Either<Failure, List<Meeting>>> call() => _repository.getTodayMeetings();
}
