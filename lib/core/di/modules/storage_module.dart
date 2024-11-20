import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class StorageModule {
  @preResolve
  @lazySingleton
  Future<SharedPreferencesWithCache> get prefs =>
      SharedPreferencesWithCache.create(cacheOptions: const SharedPreferencesWithCacheOptions());

  @singleton
  FlutterSecureStorage get secureStorage => const FlutterSecureStorage();
}
