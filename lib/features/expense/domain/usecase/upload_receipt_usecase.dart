import 'package:fpdart/fpdart.dart';
import '../../../../core/domain/failure/domain_failure.dart';
import '../repository/expense_repository.dart';

class UploadReceiptUseCase {
  final ExpensesRepository _repository;

  const UploadReceiptUseCase(this._repository);

  Future<Either<Failure, ({String path, String url})>> call(String filePath) {
    if (filePath.trim().isEmpty) {
      return Future.value(
        const Left(ValidationFailure(message: 'Receipt file path cannot be empty')),
      );
    }

    return _repository.uploadReceipt(filePath);
  }
}