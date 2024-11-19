import 'package:talker_bloc_logger/talker_bloc_logger.dart';

class AppBlocObserver extends TalkerBlocObserver {
  AppBlocObserver({
    required super.talker,
    super.settings = const TalkerBlocLoggerSettings(
      printEvents: true,
      printCreations: true,
      printClosings: true,
    ),
  });
}
