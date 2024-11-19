part of 'post_details_cubit.dart';

@freezed
class PostDetailsState with _$PostDetailsState {
  const factory PostDetailsState.loading() = _Loading;
  const factory PostDetailsState.loaded(PostEntity post) = _Loaded;
  const factory PostDetailsState.error(String message) = _Error;
}
