import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_starter/core/di/injection.dart';
import 'package:flutter_starter/core/observers/app_bloc_observer.dart';
import 'package:flutter_starter/core/services/logging/logging_service.dart';

class Initializer {
  factory Initializer() => instance;
  Initializer._internal();

  static final Initializer instance = Initializer._internal();

  Future<void> init(VoidCallback runApp) async {
    final talkerService = getIt<LoggingService>();
    // Pass all uncaught "fatal" errors from the framework
    FlutterError.onError = (details) {
      FlutterError.dumpErrorToConsole(details);
      talkerService.logError(details);
    };

    // Pass all uncaught asynchronous errors that aren't handled by the Flutter framework
    PlatformDispatcher.instance.onError = (error, stack) {
      talkerService.logError(error);
      return true;
    };

    await _initialize();
    runApp();
  }

  Future<void> _initialize() async {
    _initScreenPreference();
    _initTalker();
  }

  void _initTalker() {
    final talkerService = getIt<LoggingService>();
    Bloc.observer = AppBlocObserver(talker: talkerService.talker);
  }

  void _initScreenPreference() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
  }
}
