import 'package:flutter/material.dart';
import 'package:flutter_starter/core/config/env_config.dart';
import 'package:flutter_starter/core/di/injection.dart';
import 'package:flutter_starter/core/services/logging/logging_service.dart';
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
        Positioned.fill(child: child),
        //Can add force update screen here
        if (getIt<EnvConfig>().enableLogging)
          Positioned(
            right: 0,
            top: MediaQuery.of(context).size.height / 2,
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => TalkerScreen(
                      talker: getIt<LoggingService>().talker,
                    ),
                  ),
                );
              },
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.5),
                  borderRadius: const BorderRadius.horizontal(
                    left: Radius.circular(12),
                  ),
                ),
                child: Image.asset(
                  'assets/images/logo_dev.png',
                  width: 24,
                  height: 24,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
