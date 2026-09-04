import 'package:fpdart/fpdart.dart';
import '../../../domain/failure/domain_failure.dart';
import '../../exception/app_exception.dart';

mixin SafeApiCall {
  Future<Either<Failure, T>> safeApiCall<T>({
    required Future<T> Function() call,
    Failure? Function(AppException exception)? onException,
  }) async {
    try {
      final result = await call();
      return Right(result);
    } on AppException catch (e) {
      final customFailure = onException?.call(e);

      return Left(customFailure ?? _mapAppException(e));

    } catch (e) {
      return Left(UnknownFailure(message: e.toString()));
    }
  }

  Future<Either<Failure, T>> safeCacheCall<T>({
    required Future<T> Function() call,
  }) async {
    try {
      final result = await call();
      return Right(result);
    } on CacheException catch (e) {
      return Left(CacheFailure(message: e.message));
    } catch (e) {
      return Left(UnknownFailure(message: e.toString()));
    }
  }

  Failure _mapAppException(AppException exception) {
    final code = exception.apiError?.errorCode?.toUpperCase();
    return switch (exception) {
      ServerException()           => ServerFailure(
          message: exception.message,
          statusCode: exception.statusCode,
          errorCode: code),
      BadRequestException()       => BadRequestFailure(message: exception.message),
      UnauthorizedException()     => UnauthorizedFailure(message: exception.message),
      ForbiddenException()        => ForbiddenFailure(message: exception.message),
      NotFoundException()         => NotFoundFailure(message: exception.message),
      NetworkException()          => NetworkFailure(message: exception.message),
      TimeoutException()          => TimeoutFailure(message: exception.message),
      RequestCancelledException() => UnknownFailure(message: exception.message),
      CacheException()            => CacheFailure(message: exception.message),
      SerializationException()    => UnknownFailure(message: exception.message),
      InvalidCredentialsException() => UnauthorizedFailure(message: exception.message),
      TooManyAttemptsException() => TooManyAttemptsFailure(message: exception.message),
      ConflictException() => ConflictFailure(message: exception.message),
      ValidationException() => ValidationFailure(
          message: (exception.apiError?.validationErrors?.isNotEmpty ?? false)
              ? "${exception.message}\n${exception.apiError!.validationErrors!.combinedErrors}"
              : exception.message,
          errors: exception.apiError?.validationErrors),
      FileException()             => FileFailure(message: exception.message),
      UnknownException()            => UnknownFailure(message: exception.message),
    };
  }
}