import 'dart:convert';

import 'package:workmate/core/data/cache/preferences_keys.dart';
import 'package:workmate/features/profile/data/datasource/local/profile_local_data_source.dart';
import 'package:workmate/features/profile/data/datasource/remote/dto/employee_profile_dto.dart';
import '../../../../../core/data/cache/shared_preferences_service.dart';
import '../../../../../core/data/exception/app_exception.dart';

class ProfileLocalDataSourceImpl implements ProfileLocalDataSource {
  final PreferencesService _preferencesService;

  const ProfileLocalDataSourceImpl({
    required PreferencesService preferencesService,
  }) : _preferencesService = preferencesService;

  @override
  Future<EmployeeProfileDto?> getCachedProfile() async {
    try {
      final jsonString = _preferencesService.getString(key: PreferencesKeys.profileKey);
      if (jsonString == null || jsonString.isEmpty) {
        return null;
      }

      final json = jsonDecode(jsonString) as Map<String, dynamic>;
      return EmployeeProfileDto.fromJson(json);
    } catch (e) {
      throw CacheException.read(PreferencesKeys.profileKey, e);
    }
  }

  @override
  Future<void> cacheProfile(EmployeeProfileDto profile) async {
    try {
      final jsonString = jsonEncode(profile.toJson());
      await _preferencesService.setString(
        key: PreferencesKeys.profileKey,
        value: jsonString,
      );
    } catch (e) {
      throw CacheException.write(PreferencesKeys.profileKey, e);
    }
  }

  @override
  Future<void> clearCache() async {
    try {
      await _preferencesService.remove(key: PreferencesKeys.profileKey);
      await _preferencesService.remove(key: PreferencesKeys.profileCompletedKey);
    } catch (e) {
      throw CacheException.delete(PreferencesKeys.profileKey, e);
    }
  }

  @override
  Future<bool> isProfileCompleted() async {
    try {
      return _preferencesService.getBool(key: PreferencesKeys.profileCompletedKey) ?? false;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<void> setProfileCompleted(bool completed) async {
    try {
      await _preferencesService.setBool(
        key: PreferencesKeys.profileCompletedKey,
        value: completed,
      );
    } catch (e) {
      throw CacheException.write(PreferencesKeys.profileCompletedKey, e);
    }
  }
}