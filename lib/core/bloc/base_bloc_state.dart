import 'package:freezed_annotation/freezed_annotation.dart';

part 'base_bloc_state.freezed.dart';

@freezed
class BaseState<T> with _$BaseState<T> {
  const factory BaseState.initial() = Initial;
  const factory BaseState.loading() = Loading;
  const factory BaseState.loaded(T data) = Loaded<T>;
  const factory BaseState.error(String message) = Error;
}
