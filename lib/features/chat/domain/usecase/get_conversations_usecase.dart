import 'package:fpdart/fpdart.dart';

import '../../../../core/domain/failure/domain_failure.dart';
import '../../../../core/domain/model/paged_result.dart';
import '../entity/conversation.dart';
import '../repository/chat_repository.dart';

class GetConversationsUseCase {
  final ChatRepository _repository;
  const GetConversationsUseCase(this._repository);

  Future<Either<Failure, PagedResult<Conversation>>> call({int page = 1}) =>
      _repository.getConversations(page: page);
}