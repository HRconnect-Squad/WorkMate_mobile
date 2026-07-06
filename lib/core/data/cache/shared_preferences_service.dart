import 'package:shared_preferences/shared_preferences.dart';

abstract class PreferencesService {
  Future<void> setString({required String key, required String value});

  String? getString({required String key});

  Future<void> setBool({required String key, required bool value});

  bool? getBool({required String key});

  Future<void> setInt({required String key, required int value});

  int? getInt({required String key});

  Future<void> setDouble({required String key, required double value});

  double? getDouble({required String key});

  Future<void> setStringList({
    required String key,
    required List<String> value,
  });

  List<String>? getStringList({required String key});

  bool containsKey({required String key});

  Set<String> getKeys();

  Future<void> remove({required String key});

  Future<void> clear();
}

class SharedPreferencesServiceImpl implements PreferencesService {
  final SharedPreferences _prefs;

  SharedPreferencesServiceImpl(this._prefs);

  @override
  Future<void> setString({required String key, required String value}) async {
    await _prefs.setString(key, value);
  }

  @override
  String? getString({required String key}) {
    return _prefs.getString(key);
  }

  @override
  Future<void> setBool({required String key, required bool value}) async {
    await _prefs.setBool(key, value);
  }

  @override
  bool? getBool({required String key}) {
    return _prefs.getBool(key);
  }

  @override
  Future<void> setInt({required String key, required int value}) async {
    await _prefs.setInt(key, value);
  }

  @override
  int? getInt({required String key}) {
    return _prefs.getInt(key);
  }

  @override
  Future<void> setDouble({required String key, required double value}) async {
    await _prefs.setDouble(key, value);
  }

  @override
  double? getDouble({required String key}) {
    return _prefs.getDouble(key);
  }

  @override
  Future<void> setStringList({
    required String key,
    required List<String> value,
  }) async {
    await _prefs.setStringList(key, value);
  }

  @override
  List<String>? getStringList({required String key}) {
    return _prefs.getStringList(key);
  }

  @override
  bool containsKey({required String key}) {
    return _prefs.containsKey(key);
  }

  @override
  Set<String> getKeys() {
    return _prefs.getKeys();
  }

  @override
  Future<void> remove({required String key}) async {
    await _prefs.remove(key);
  }

  @override
  Future<void> clear() async {
    await _prefs.clear();
  }
}
