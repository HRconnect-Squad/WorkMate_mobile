import 'package:fpdart/fpdart.dart';
import '../../../../core/domain/failure/domain_failure.dart';
import '../../domain/entity/auth_type.dart';
import '../../domain/entity/register.dart';
import '../../domain/entity/user.dart';
import '../../domain/entity/verify_otp.dart';
import '../../domain/repository/auth_repository.dart';
import '../data_source/local/auth_local_data_source.dart';
import '../data_source/remote/auth_remote_data_source.dart';
import '../data_source/remote/dto/request/forgot_password_request.dart';
import '../data_source/remote/dto/request/login_request.dart';
import '../data_source/remote/dto/request/reset_password_request.dart';
import '../mappers/auth_mapper.dart';
import '../mappers/auth_failure_mapper.dart';

class AuthRepositoryImp implements AuthRepository {
  final AuthLocalDataSource _localDataSource;
  final AuthRemoteDataSource _remoteDataSource;

  const AuthRepositoryImp({
    required AuthLocalDataSource localDataSource,
    required AuthRemoteDataSource remoteDataSource,
  })
      : _localDataSource = localDataSource,
        _remoteDataSource = remoteDataSource;

  @override
  Future<Either<Failure, User>> login({
    required String identifier,
    required String password,
    required AuthType loginType,
  }) async {
    try {
      final request = LoginRequest(
        identifier: identifier,
        password: password,
        loginType: loginType,
      );

      final response = await _remoteDataSource.login(request);

      if (response.accessToken != null && response.accessToken!.isNotEmpty) {
        await _localDataSource.saveToken(response.accessToken!);
        await _localDataSource.saveIdentifier(
            response.user?.email ?? response.user?.phone ?? identifier);
      } else {
        return Left(const ServerFailure('Access token is missing'));
      }

      return Right(AuthMapper.toDomain(response.user));
    } catch (e) {
      return Left(AuthFailureMapper.mapException(e));
    }
  }

  @override
  Future<Either<Failure, String?>> getToken() async {
    try {
      final token = await _localDataSource.getToken();
      return Right(token);
    } catch (e) {
      return Left(AuthFailureMapper.mapException(e));
    }
  }

  @override
  Future<Either<Failure, Unit>> saveToken(String token) async {
    try {
      await _localDataSource.saveToken(token);
      return const Right(unit);
    } catch (e) {
      return Left(AuthFailureMapper.mapException(e));
    }
  }

  @override
  Future<Either<Failure, Unit>> clearToken() async {
    try {
      await _localDataSource.clearToken();
      return const Right(unit);
    } catch (e) {
      return Left(AuthFailureMapper.mapException(e));
    }
  }

  @override
  Future<Either<Failure, bool>> hasToken() async {
    try {
      final hasToken = await _localDataSource.hasToken();
      return Right(hasToken);
    } catch (e) {
      return Left(AuthFailureMapper.mapException(e));
    }
  }

  @override
  Future<Either<Failure, String>> forgotPassword({
    required String identifier,
    required AuthType loginType,
  }) async {
    try {
      final request = ForgotPasswordRequest(
        identifier: identifier,
        loginType: loginType,
      );

      final response = await _remoteDataSource.forgotPassword(request);
      if (response.identifier == null || response.identifier?.isEmpty == true) {
        return Left(ServerFailure('identifier is null or empty'));
      }
      return Right(response.identifier ?? '');
    } catch (e) {
      return Left(AuthFailureMapper.mapException(e));
    }
  }

  @override
  Future<Either<Failure, User>> resetPassword({
    required String identifier,
    required String code,
    required String password,
    required String passwordConfirmation,
  }) async {
    try {
      final request = ResetPasswordRequest(
        identifier: identifier,
        code: code,
        password: password,
        passwordConfirmation: passwordConfirmation,
      );

      final response = await _remoteDataSource.resetPassword(request);

      if (response.accessToken == null ||
          response.accessToken?.isEmpty == true) {
        return Left(ServerFailure('Access token is missing'));
      }

      await _localDataSource.saveToken(response.accessToken ?? '');
      await _localDataSource.saveIdentifier(
          response.user?.email ?? response.user?.phone ?? identifier);

      return Right(AuthMapper.toDomain(response.user));
    } catch (e) {
      return Left(AuthFailureMapper.mapException(e));
    }
  }

  @override
  Future<Either<Failure, String?>> getIdentifier() async {
    try {
      final mail = await _localDataSource.getIdentifier();
      return Right(mail);
    } catch (e) {
      return Left(AuthFailureMapper.mapException(e));
    }
  }

  @override
  Future<Either<Failure, Unit>> saveIdentifier(String mail) async {
    try {
      await _localDataSource.saveIdentifier(mail);
      return Right(unit);
    } catch (e) {
      return Left(AuthFailureMapper.mapException(e));
    }
  }

  @override
  Future<Either<Failure, Unit>> clearIdentifier() async {
    try {
      await _localDataSource.clearIdentifier();
      return Right(unit);
    } catch (e) {
      return Left(AuthFailureMapper.mapException(e));
    }
  }

  @override
  Future<Either<Failure, bool>> register({required Register register}) async {
    try {
      final registerDtoRequest = AuthMapper.toRegisterDtoRequest(register);
      final response = await _remoteDataSource.register(
        registerDtoRequest: registerDtoRequest,
      );
      return Right(response);
    } catch (e) {
      return Left(AuthFailureMapper.mapException(e));
    }
  }

  @override
  Future<Either<Failure, User>> verifyOTP({
    required VerifyOTP verifyOtp,
  }) async {
    try {
      final verifyOtpDto = AuthMapper.toVerifyOtpDto(verifyOtp);
      final otpVerifyResponse = await _remoteDataSource.verifyOTP(
        verifyOtpDto: verifyOtpDto,
      );
      if (otpVerifyResponse.accessToken != null &&
          otpVerifyResponse.accessToken!.isNotEmpty) {
        await saveToken(otpVerifyResponse.accessToken!);
        await _localDataSource.saveIdentifier(
            otpVerifyResponse.user?.email ?? otpVerifyResponse.user?.phone ??
                "");
      }
      final user = AuthMapper.toDomain(otpVerifyResponse.user);
      return Right(user);
    } catch (e) {
      return Left(AuthFailureMapper.mapException(e));
    }
  }

  @override
  Future<Either<Failure, bool>> changePassword({required String currentPassword,
    required String newPassword, required String newPasswordConfirmation}) async {
    try {
       final response = await _remoteDataSource.changePassword(
        currentPassword: currentPassword,
        newPassword: newPassword,
        newPasswordConfirmation: newPasswordConfirmation,
      );
      return Right(response);
    } catch (e) {
      return Left(AuthFailureMapper.mapException(e));
    }
  }
}
