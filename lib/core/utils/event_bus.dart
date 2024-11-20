import 'dart:async';

/// A simple event bus implementation using streams.
class EventBus {
  // Factory constructor to return the same instance
  factory EventBus() => _instance;
  
  // Private constructor
  EventBus._();

  // Static instance of the EventBus
  static final EventBus _instance = EventBus._();

  // StreamController for broadcasting events
  final StreamController<dynamic> _controller = StreamController.broadcast();

  /// Get the stream of events.
  Stream<dynamic> get stream => _controller.stream;

  /// Fire an event of type [T].
  void fire<T>(T event) {
    _controller.add(event);
  }

  /// Subscribe to an event of type [T].
  StreamSubscription<T> on<T>(void Function(T event) listener) {
    return _controller.stream.where((event) => event is T).cast<T>().listen(listener);
  }

  /// Close the event bus and release resources.
  void close() {
    _controller.close();
  }
}