import 'package:fpdart/fpdart.dart';

import '../../../../core/domain/failure/domain_failure.dart';
import '../enitity/UserInfo.dart';

class GetUserInfoUseCase {
  GetUserInfoUseCase();

  Future<Either<Failure, UserInfo>> call() async {
    try {
      final user = UserInfo(
        firstname: "Nourhan",
        lastname: "Adel",
        imageUser: "https://i.pravatar.cc/150",
      );

      return Right(user);
    } catch (e) {
      return Left(UnknownFailure());
    }
  }
}
