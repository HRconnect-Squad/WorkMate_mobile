import '../../../../../core/data/cache/preferences_keys.dart';
import '../../../../../core/data/cache/secure_storage_data_source.dart';
import '../../../../../core/data/cache/shared_preferences_service.dart';
import '../../../../../core/data/exception/app_exception.dart';
import '../../../../../core/data/network/constant/api_constant.dart';
import 'auth_local_data_source.dart';

class AuthLocalDataSourceImp implements AuthLocalDataSource {
  final SecureStorageService _secureStorageService;
  final PreferencesService _preferencesService;

  const AuthLocalDataSourceImp({
    required SecureStorageService secureStorageService,
    required PreferencesService preferencesService,
  }) : _secureStorageService = secureStorageService,
       _preferencesService = preferencesService;

  @override
  Future<String?> getToken() async {
    try {
      return await _secureStorageService.read(key: ApiConstants.localDataTokenKey);
    } catch (e) {
      throw CacheException.read(ApiConstants.localDataTokenKey, e);
    }
  }

  @override
  Future<void> saveToken(String token) async {
    if (token.isEmpty) {
      throw CacheException.invalidData(
        ApiConstants.localDataTokenKey,
        'Token cannot be empty',
      );
    }
    try {
      await _secureStorageService.write(
        key: ApiConstants.localDataTokenKey,
        value: token,
      );
    } catch (e) {
      throw CacheException.write(ApiConstants.localDataTokenKey, e);
    }
  }

  @override
  Future<void> clearToken() async {
    try {
      await _secureStorageService.delete(key: ApiConstants.localDataTokenKey);
    } catch (e) {
      throw CacheException.delete(ApiConstants.localDataTokenKey, e);
    }
  }

  @override
  Future<bool> hasToken() async {
    try {
      final token = await getToken();
      return token?.isNotEmpty ?? false;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<void> saveIdentifier(String email) async {
    try {
      await _preferencesService.setString(
        key: PreferencesKeys.userIdentifier,
        value: email,
      );
    } catch (e) {
      throw CacheException.write(PreferencesKeys.userIdentifier, e);
    }
  }

  @override
  Future<String?> getIdentifier() async {
    try {
      return _preferencesService.getString(key: PreferencesKeys.userIdentifier);
    } catch (e) {
      throw CacheException.read(PreferencesKeys.userIdentifier, e);
    }
  }

  @override
  Future<void> clearIdentifier() async {
    try {
      await _preferencesService.remove(key: PreferencesKeys.userIdentifier);
    } catch (e) {
      throw CacheException.delete(PreferencesKeys.userIdentifier, e);
    }
  }
}
