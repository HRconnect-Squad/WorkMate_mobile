
import '../../../domain/entity/UserLocation.dart';

abstract class LocationRemoteDataSource {
  Future< Location> getCurrentLocation();
  Future<double> getDistanceBetweenLocations(Location location1, Location location2);
}
