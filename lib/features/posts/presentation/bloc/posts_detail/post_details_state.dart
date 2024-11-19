part of 'post_details_bloc.dart';

@freezed
class PostDetailsState with _$PostDetailsState {
  const factory PostDetailsState({
    required PostEntity post,
  }) = _PostDetailsState;
}
