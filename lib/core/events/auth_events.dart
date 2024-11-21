/// Event fired when user session has expired
class SessionExpiredEvent {
  final String reason;

  const SessionExpiredEvent({required this.reason});
}
