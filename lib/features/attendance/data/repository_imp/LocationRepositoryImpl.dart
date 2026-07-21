import 'package:fpdart/fpdart.dart';
import '../../../../core/domain/failure/domain_failure.dart';
import '../../../auth/domain/failures/failure.dart';
import '../../domain/enitity/UserLocation.dart';
import '../../domain/repository/LocationRepository.dart';
import '../data_source/remote/LocationRemoteDataSource.dart';

class LocationRepositoryImpl implements LocationRepository {
  final LocationRemoteDataSource dataSource;

  LocationRepositoryImpl(this.dataSource);

  @override
  Future<Either<Failure, Location>> getCurrentLocation() async {
    try {
      final location = await dataSource.getCurrentLocation();
      return Right(location);
    } catch (e) {
      return Left(ServerFailure(message: ''));
    }
  }


  @override
  Future<Either<Failure, double>> getDistanceBetweenLocations(Location location1, Location location2) async{
    try {
      final distance = await dataSource.getDistanceBetweenLocations(location1, location2);
      return Right(distance);
    } catch (e) {
      return Left(ServerFailure(message: ''));
    }
  }
}
