import 'package:fpdart/fpdart.dart';

import '../../../../core/data/network/helper/safe_api_call.dart';
import '../../../../core/domain/failure/domain_failure.dart';
import '../../domain/entity/UserLocation.dart';
import '../../domain/repository/LocationRepository.dart';
import '../data_source/remote/location_remote-data_source.dart';

class LocationRepositoryImpl with SafeApiCall implements LocationRepository {
  final LocationRemoteDataSource _dataSource;

  const LocationRepositoryImpl({
    required LocationRemoteDataSource dataSource,
  }) : _dataSource = dataSource;

  @override
  Future<Either<Failure, Location>> getCurrentLocation() async {
    return safeApiCall(call: () => _dataSource.getCurrentLocation());
  }

  @override
  Future<Either<Failure, double>> getDistanceBetweenLocations(
      Location location1,
      Location location2,
      ) async {
    return safeApiCall(
      call: () => _dataSource.getDistanceBetweenLocations(location1, location2),
    );
  }
}