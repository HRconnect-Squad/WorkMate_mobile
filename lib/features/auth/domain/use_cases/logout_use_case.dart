import 'package:fpdart/fpdart.dart';
import '../../../../core/domain/failure/domain_failure.dart';
import '../../../../core/domain/service/cache_manager.dart'; // ← domain interface
import '../repository/auth_repository.dart';

class LogoutUseCase {
  final AuthRepository _authRepository;
  final CacheManager _cacheManager;

  const LogoutUseCase({
    required AuthRepository authRepository,
    required CacheManager cacheManager,
  })  : _authRepository = authRepository,
        _cacheManager = cacheManager;

  Future<Either<Failure, Unit>> call() async {
    await _authRepository.clearToken();
    await Future(() => _cacheManager.clearAllCache());
    return const Right(unit);
  }
}