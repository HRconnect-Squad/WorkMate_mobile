import 'package:geolocator/geolocator.dart' hide LocationServiceDisabledException;
import '../../../../../core/data/exception/app_exception.dart';
import '../../../domain/entity/UserLocation.dart';
import 'location_remote-data_source.dart';

class LocationRemoteDataSourceImpl implements LocationRemoteDataSource {
  @override
  Future<Location> getCurrentLocation() async {
    final serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw const LocationServiceDisabledException();
    }

    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw const LocationPermissionDeniedException();
      }
    }

    if (permission == LocationPermission.deniedForever) {
      throw const LocationPermissionDeniedForeverException();
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
  Future<double> getDistanceBetweenLocations(
      Location location1,
      Location location2,
      ) async {
    return Geolocator.distanceBetween(
      location1.latitude,
      location1.longitude,
      location2.latitude,
      location2.longitude,
    );
  }
}