import 'dart:convert';

import 'package:workmate/features/attendance/data/data_source/local/ttendance_local_data_source.dart';

import '../../../../../core/data/cache/preferences_keys.dart';
import '../../../../../core/data/cache/shared_preferences_service.dart';
import '../../../domain/enitity/UserInfo.dart';

class AttendanceLocalDataSourceImpl implements AttendanceLocalDataSource {
  final PreferencesService _preferencesService;

  const AttendanceLocalDataSourceImpl({
    required PreferencesService preferencesService,
  }) : _preferencesService = preferencesService;

  @override
  Future<UserInfo?> getCachedUserInfo() async {
    final jsonString = _preferencesService.getString(
      key: PreferencesKeys.profileKey,
    );

    if (jsonString == null || jsonString.isEmpty) {
      return null;
    }

    final json = jsonDecode(jsonString) as Map<String, dynamic>;

    return UserInfo(
      firstname: json['first_name'] as String? ?? '',
      lastname: json['last_name'] as String? ?? '',
      imageUser: json['avatar_url'] as String? ?? '',
    );
  }
}