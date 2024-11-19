part of 'post_bloc.dart';

@freezed
class PostsEvent with _$PostsEvent {
  const factory PostsEvent.fetchData() = _FetchData;
}
