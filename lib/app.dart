import 'package:flutter/material.dart';
import 'package:flutter_starter/core/presentation/widgets/base_widget.dart';
import 'package:flutter_starter/core/router/router.dart';
import 'package:flutter_starter/core/theme/theme_imports.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: AppStrings.appName,
      routerConfig: router,
      theme: AppTheme.theme,
      debugShowCheckedModeBanner: false,
      builder: (context, child) {
        return BaseWidget(child: child ?? const SizedBox.shrink());
      },
    );
  }
}
