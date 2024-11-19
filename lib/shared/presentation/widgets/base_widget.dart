import 'package:flutter/material.dart';
import 'package:flutter_starter/core/config/env_config.dart';
import 'package:flutter_starter/core/di/injection.dart';
import 'package:flutter_starter/core/services/logging/logging_service.dart';
import 'package:flutter_starter/core/theme/theme_imports.dart';
import 'package:talker_flutter/talker_flutter.dart';

class BaseWidget extends StatelessWidget {
  final Widget child;

  const BaseWidget({
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        if (getIt<EnvConfig>().enableLogging)
          Positioned(
            right: 0,
            top: 0,
            bottom: 0,
            child: Center(
              child: FloatingActionButton(
                elevation: 0,
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => TalkerScreen(
                        talker: getIt<LoggingService>().talker,
                      ),
                    ),
                  );
                },
                backgroundColor: Colors.transparent,
                child: Icon(
                  Icons.logo_dev,
                  color: AppColors.black.withOpacity(0.05),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
