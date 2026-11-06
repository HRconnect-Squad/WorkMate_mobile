import 'package:fpdart/fpdart.dart';
import '../../../../core/domain/failure/domain_failure.dart';
import '../repository/chat_repository.dart';

class MarkConversationReadUseCase {
  final ChatRepository _repository;
  const MarkConversationReadUseCase(this._repository);

  Future<Either<Failure, Unit>> call(int contactId) =>
      _repository.markConversationRead(contactId);
}