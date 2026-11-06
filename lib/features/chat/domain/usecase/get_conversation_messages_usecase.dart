import 'package:fpdart/fpdart.dart';

import '../../../../core/domain/failure/domain_failure.dart';
import '../../../../core/domain/model/paged_result.dart';
import '../entity/message.dart';
import '../repository/chat_repository.dart';

class GetConversationMessagesUseCase {
  final ChatRepository _repository;
  const GetConversationMessagesUseCase(this._repository);

  Future<Either<Failure, PagedResult<Message>>> call({
    required int contactId,
    int page = 1,
  }) =>
      _repository.getConversationMessages(contactId: contactId, page: page);
}