import 'package:flutter_starter/core/services/logging/logging_service.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';

TalkerDioLogger loggingInterceptor(LoggingService talkerService) {
  return TalkerDioLogger(
    talker: talkerService.talker,
    settings: const TalkerDioLoggerSettings(
      printRequestHeaders: true,
      printResponseHeaders: true,
    ),
  );
}
