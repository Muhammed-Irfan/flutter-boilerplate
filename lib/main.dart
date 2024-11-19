import 'package:flutter/material.dart';
import 'package:flutter_starter/app.dart';
import 'package:flutter_starter/core/di/injection.dart';
import 'package:flutter_starter/core/utils/initializer.dart';

Future<void> mainCommon(String environment) async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies(environment: environment);

  Initializer.instance.init(() {
    runApp(const MyApp());
  });
}
