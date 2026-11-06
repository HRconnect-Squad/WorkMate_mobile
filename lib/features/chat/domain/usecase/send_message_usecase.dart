import 'package:fpdart/fpdart.dart';

import '../../../../core/domain/failure/domain_failure.dart';
import '../../../../core/domain/failure/validation_error.dart';
import '../entity/message.dart';
import '../repository/chat_repository.dart';

class SendMessageUseCase {
  static const int maxLength = 2000;

  final ChatRepository _repository;
  const SendMessageUseCase(this._repository);

  Future<Either<Failure, Message>> call({
    required int receiverId,
    required String text,
  }) {
    final trimmed = text.trim();
    final errors = <String, List<String>>{};

    if (receiverId <= 0) {
      errors['receiver_id'] = ['Please choose who to message'];
    }
    if (trimmed.isEmpty) {
      errors['message'] = ['Message cannot be empty'];
    } else if (trimmed.length > maxLength) {
      errors['message'] = ['Message cannot exceed $maxLength characters'];
    }

    if (errors.isNotEmpty) {
      return Future.value(Left(ValidationFailure(
        message: 'Please check your input',
        errors: ValidationErrors(errors),
      )));
    }

    return _repository.sendMessage(receiverId: receiverId, text: trimmed);
  }
}