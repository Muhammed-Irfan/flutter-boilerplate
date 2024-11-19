import 'package:flutter/material.dart';

/// A widget that upon tap attempts to hide the keyboard.
class KeyboardDismisser extends StatelessWidget {
  const KeyboardDismisser({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: child,
    );
  }
}
