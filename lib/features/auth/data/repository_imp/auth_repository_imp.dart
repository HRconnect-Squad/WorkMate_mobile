import 'package:fpdart/fpdart.dart';
import '../../../../core/data/exception/app_exception.dart';
import '../../../../core/data/network/helper/safe_api_call.dart';
import '../../../../core/domain/failure/domain_failure.dart';
import '../../domain/entity/auth_type.dart';
import '../../domain/entity/register.dart';
import '../../domain/entity/user.dart';
import '../../domain/entity/verification_type.dart';
import '../../domain/entity/verify_otp.dart';
import '../../domain/repository/auth_repository.dart';
import '../data_source/local/auth_local_data_source.dart';
import '../data_source/remote/auth_remote_data_source.dart';
import '../data_source/remote/dto/request/check_forgot_password_otp_request_dto.dart';
import '../data_source/remote/dto/request/login_request.dart';
import '../data_source/remote/dto/request/reset_password_request.dart';
import '../data_source/remote/dto/request/send_otp_request_dto.dart';
import '../mappers/auth_mapper.dart';
import '../mappers/auth_failure_mapper.dart';

class AuthRepositoryImp with SafeApiCall implements AuthRepository {
  final AuthLocalDataSource _localDataSource;
  final AuthRemoteDataSource _remoteDataSource;

  const AuthRepositoryImp({
    required AuthLocalDataSource localDataSource,
    required AuthRemoteDataSource remoteDataSource,
  })  : _localDataSource = localDataSource,
        _remoteDataSource = remoteDataSource;

  // ─── Remote Operations ────────────────────────────────────────────────────
  @override
  Future<Either<Failure, User>> login({
    required String identifier,
    required String password,
    required AuthType loginType,
  }) =>
      safeApiCall(
        call: () async {
          final response = await _remoteDataSource.login(
            LoginRequest(
              identifier: identifier,
              password: password,
              loginType: loginType,
            ),
          );

          final token = response.accessToken;
          if (token == null || token.isEmpty) {
            throw const ServerException(message: 'Access token is missing');
          }

          await _localDataSource.saveToken(token);
          await _localDataSource.saveIdentifier(
            response.user?.email ?? response.user?.phone ?? identifier,
          );

          return AuthMapper.toDomain(response.user);
        },
        onException: AuthFailureMapper.mapException,
      );

  @override
  Future<Either<Failure, bool>> register({
    required Register register,
  }) =>
      safeApiCall(
        call: () async {
          final request = AuthMapper.toRegisterDtoRequest(register);
          return await _remoteDataSource.register(
            registerDtoRequest: request,
          );
        },
        onException: AuthFailureMapper.mapException,
      );

  @override
  Future<Either<Failure, User>> verifyOTP({
    required VerifyOTP verifyOtp,
  }) =>
      safeApiCall(
        call: () async {
          final request = AuthMapper.toVerifyOtpDto(verifyOtp);
          final response = await _remoteDataSource.verifyOTP(
            verifyOtpDto: request,
          );

          final token = response.accessToken;
          if (token != null && token.isNotEmpty) {
            await _localDataSource.saveToken(token);
            await _localDataSource.saveIdentifier(
              response.user?.email ?? response.user?.phone ?? '',
            );
          }
          else {
            throw const ServerException(message: 'Access token is missing');
          }

          return AuthMapper.toDomain(response.user);
        },
        onException: AuthFailureMapper.mapException,
      );

  @override
  Future<Either<Failure, String>> sendOtp({
    required String identifier,
    required AuthType loginType,
    required VerificationType purpose,
  }) =>
      safeApiCall(
        call: () async {
          final response = await _remoteDataSource.sendOtp(
            SendOtpRequestDto(
              type: purpose.value,
              loginType: loginType.value,
              identifier: identifier,
            ),
          );

          final responseIdentifier = response.identifier;
          if (responseIdentifier == null || responseIdentifier.isEmpty) {
            throw const ServerException(message: 'Identifier is missing in response');
          }

          return responseIdentifier;
        },
        onException: AuthFailureMapper.mapException,
      );

  @override
  Future<Either<Failure, Unit>> checkForgotPasswordOtp({
    required String identifier,
    required String code,
  }) =>
      safeApiCall(
        call: () async {
          await _remoteDataSource.checkForgotPasswordOtp(
            CheckForgotPasswordOtpRequestDto(identifier: identifier, code: code),
          );
          return unit;
        },
        onException: AuthFailureMapper.mapException,
      );

  @override
  Future<Either<Failure, User>> resetPassword({
    required String identifier,
    required String code,
    required String password,
    required String passwordConfirmation,
  }) =>
      safeApiCall(
        call: () async {
          final response = await _remoteDataSource.resetPassword(
            ResetPasswordRequest(
              identifier: identifier,
              code: code,
              password: password,
              passwordConfirmation: passwordConfirmation,
            ),
          );

          final token = response.accessToken;
          if (token == null || token.isEmpty) {
            throw const ServerException(message: 'Access token is missing');
          }

          await _localDataSource.saveToken(token);
          await _localDataSource.saveIdentifier(
            response.user?.email ?? response.user?.phone ?? identifier,
          );

          return AuthMapper.toDomain(response.user);
        },
        onException: AuthFailureMapper.mapException,
      );

  @override
  Future<Either<Failure, bool>> changePassword({
    required String currentPassword,
    required String newPassword,
    required String newPasswordConfirmation,
  }) =>
      safeApiCall(
        call: () => _remoteDataSource.changePassword(
          currentPassword: currentPassword,
          newPassword: newPassword,
          newPasswordConfirmation: newPasswordConfirmation,
        ),
        onException: AuthFailureMapper.mapException,
      );


  // ─── Local / Cache Operations ─────────────────────────────────────────────
  @override
  Future<Either<Failure, String?>> getToken() =>
      safeCacheCall(call: () => _localDataSource.getToken());

  @override
  Future<Either<Failure, Unit>> saveToken(String token) =>
      safeCacheCall(
        call: () async {
          await _localDataSource.saveToken(token);
          return unit;
        },
      );

  @override
  Future<Either<Failure, Unit>> clearToken() =>
      safeCacheCall(
        call: () async {
          await _localDataSource.clearToken();
          return unit;
        },
      );

  @override
  Future<Either<Failure, bool>> hasToken() =>
      safeCacheCall(call: () => _localDataSource.hasToken());

  @override
  Future<Either<Failure, String?>> getIdentifier() =>
      safeCacheCall(call: () => _localDataSource.getIdentifier());

  @override
  Future<Either<Failure, Unit>> saveIdentifier(String identifier) =>
      safeCacheCall(
        call: () async {
          await _localDataSource.saveIdentifier(identifier);
          return unit;
        },
      );

  @override
  Future<Either<Failure, Unit>> clearIdentifier() =>
      safeCacheCall(
        call: () async {
          await _localDataSource.clearIdentifier();
          return unit;
        },
      );
}
