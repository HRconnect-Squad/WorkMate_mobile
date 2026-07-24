import 'package:fpdart/fpdart.dart';
import '../../../../core/domain/failure/domain_failure.dart';
import '../../../auth/domain/failures/failure.dart';
import '../enitity/UserLocation.dart';

abstract class LocationRepository {
  Future<Either<Failure, Location>> getCurrentLocation();
  Future<Either<Failure, double>> getDistanceBetweenLocations(Location location1, Location location2);
}
