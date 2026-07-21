import 'package:fpdart/fpdart.dart';
import 'package:geolocator/geolocator.dart';
import '../../../domain/enitity/UserLocation.dart';
import 'LocationRemoteDataSource.dart';

class LocationRemoteDataSourceImpl implements LocationRemoteDataSource {
  @override
  Future<Location> getCurrentLocation() async {
    final serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw Exception("LOCATION_SERVICE_DISABLED");
    }

    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw Exception("PERMISSION_DENIED");
      }
    }

    if (permission == LocationPermission.deniedForever) {
      throw Exception("PERMISSION_DENIED_FOREVER");
    }

    final position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    return Location(
      latitude: position.latitude,
      longitude: position.longitude,
    );
  }

  @override
  Future<double> getDistanceBetweenLocations(Location location1, Location location2) async {
    return Geolocator.distanceBetween(
      location1.latitude,
      location1.longitude,
      location2.latitude,
      location2.longitude,
    );
  }
}
