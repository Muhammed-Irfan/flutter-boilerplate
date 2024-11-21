import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_starter/core/bloc/base_bloc.dart';
import 'package:flutter_starter/core/bloc/base_bloc_state.dart';
import 'package:flutter_starter/core/events/auth_events.dart';
import 'package:flutter_starter/core/usecases/usecase.dart';
import 'package:flutter_starter/core/utils/event_bus.dart';
import 'package:flutter_starter/core/utils/safety_utils.dart';
import 'package:flutter_starter/features/auth/domain/usecases/logout.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'auth_bloc.freezed.dart';
part 'auth_event.dart';
part 'auth_state.dart';

@injectable
class AuthBloc extends BaseBloc<AuthEvent, AuthState> {
  final Logout _logout;
  final EventBus _eventBus;

  late final StreamSubscription _sessionExpiredSubscription;

  AuthBloc(this._logout, this._eventBus) : super() {
    _sessionExpiredSubscription = _eventBus.on<SessionExpiredEvent>(_handleSessionExpired);
  }

  void _handleSessionExpired(SessionExpiredEvent event) {
    add(AuthEvent.logout(reason: event.reason));
  }

  @override
  Future<void> handleEvent(AuthEvent event, Emitter<BaseState<AuthState>> emit) async {
    await event.map(
      logout: (e) => _onLogout(e, emit),
    );
  }

  Future<void> _onLogout(_Logout event, Emitter<BaseState<AuthState>> emit) async {
    executeSafely(
      () => _logout(const NoParams()),
      finallyAction: () => emitLoaded(emit, const AuthState.loggedOut()),
    );
  }

  @override
  Future<void> close() {
    _sessionExpiredSubscription.cancel();
    return super.close();
  }
}
