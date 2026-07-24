import 'package:fpdart/fpdart.dart';
import '../../../../core/domain/failure/domain_failure.dart';
import '../enitity/UserLocation.dart';
import '../repository/LocationRepository.dart';

class GetCurrentLocationUseCase {
  final LocationRepository repository;

  GetCurrentLocationUseCase(this.repository);

  Future<Either<Failure, Location>> call() {
    return repository.getCurrentLocation();
  }
}
