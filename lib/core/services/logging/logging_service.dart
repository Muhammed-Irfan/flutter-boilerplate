import 'package:flutter_starter/core/config/env_config.dart';
import 'package:injectable/injectable.dart';
import 'package:talker_flutter/talker_flutter.dart';

@singleton
class LoggingService {
  //Uses talker for logging
  late final Talker _talker;

  LoggingService(EnvConfig config) {
    _talker = TalkerFlutter.init(
      settings: TalkerSettings(enabled: config.enableLogging),
    );
  }

  Talker get talker => _talker;

  void log(String message) => _talker.info(message);

  void logError(Object error) => _talker.error(error);
}
