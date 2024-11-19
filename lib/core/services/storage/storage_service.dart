import 'package:flutter_starter/core/constants/preferences.dart';
import 'package:flutter_starter/core/services/storage/storage_service_provider.dart';
import 'package:injectable/injectable.dart';

abstract class StorageService {
  void setIsFirstTime();
  bool isFirstTime();
}

@Injectable(as: StorageService)
class StorageServiceImpl implements StorageService {
  final StorageServiceProvider _store;

  StorageServiceImpl(this._store);

  @override
  bool isFirstTime() => _store.getBool(Preferences.initialLaunch) ?? true;

  @override
  void setIsFirstTime() => _store.saveBool(Preferences.initialLaunch, false);
}
