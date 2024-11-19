part of 'post_bloc.dart';

@freezed
class PostsState with _$PostsState {
  const factory PostsState.loading() = _Loading;
  const factory PostsState.loaded(List<PostEntity> data) = _Loaded;
  const factory PostsState.error(String message) = _Error;
}
