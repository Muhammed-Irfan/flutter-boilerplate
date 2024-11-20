import 'dart:async';
import 'dart:ui';

class AppDebouncer {
  final int milliseconds;
  Timer? _timer;

  AppDebouncer({required this.milliseconds});

  void run(VoidCallback action) {
    // Cancel the previous timer
    _timer?.cancel();
    // Start a new timer
    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }

  void cancel() {
    _timer?.cancel();
  }
}
