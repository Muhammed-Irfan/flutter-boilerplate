part of 'post_bloc.dart';

@freezed
class PostState with _$PostState {
  const factory PostState({
    @Default([]) List<PostEntity> posts,
  }) = _PostState;
}
