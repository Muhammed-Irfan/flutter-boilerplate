// ignore_for_file: avoid_positional_boolean_parameters

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class StorageServiceProvider {
  Future<void> saveSecureToken(String key, String token);
  Future<String?> getSecureToken(String key);
  Future<void> deleteSecureTokens();
  Future<void> saveString(String key, String value);
  String? getString(String key);
  Future<void> saveBool(String key, bool value);
  bool? getBool(String key);
  Future<void> remove(String key);
  Future<void> clearAll();
}

@Singleton(as: StorageServiceProvider)
class StorageServiceProviderImpl implements StorageServiceProvider {
  final FlutterSecureStorage _secureStorage;
  final SharedPreferencesWithCache _prefs;

  StorageServiceProviderImpl(this._secureStorage, this._prefs);

  @override
  Future<void> saveSecureToken(String key, String token) async {
    await _secureStorage.write(key: key, value: token);
  }

  @override
  Future<String?> getSecureToken(String key) => _secureStorage.read(key: key);

  @override
  Future<void> deleteSecureTokens() async {
    await _secureStorage.deleteAll();
  }

  @override
  Future<void> saveString(String key, String value) async {
    await _prefs.setString(key, value);
  }

  @override
  String? getString(String key) => _prefs.getString(key);

  @override
  Future<void> saveBool(String key, bool value) async {
    await _prefs.setBool(key, value);
  }

  @override
  bool? getBool(String key) => _prefs.getBool(key);

  @override
  Future<void> remove(String key) async {
    await _prefs.remove(key);
  }

  @override
  Future<void> clearAll() async {
    await _prefs.clear();
    await _secureStorage.deleteAll();
  }
}
