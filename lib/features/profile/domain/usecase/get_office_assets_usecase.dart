import 'package:fpdart/fpdart.dart';
import '../../../../core/domain/failure/domain_failure.dart';
import '../entity/office_asset.dart';
import '../repository/profile_repository.dart';

class GetOfficeAssetsUseCase {
  final ProfileRepository _repository;

  const GetOfficeAssetsUseCase(this._repository);

  Future<Either<Failure, List<OfficeAsset>>> call() {
    return _repository.getOfficeAssets();
  }
}