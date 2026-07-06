import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';
import '../../../../core/data/cache/cache_manager.dart';
import '../../../../core/domain/failure/domain_failure.dart';
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
    try {
      await _authRepository.clearToken();
    } catch (e) {
      debugPrint('⚠️ Failed to clear token: $e');
    }
    try {
      await _cacheManager.clearAllCache();
    } catch (e) {
      debugPrint('⚠️ Failed to clear cache: $e');
    }
    return const Right(unit);
  }
}