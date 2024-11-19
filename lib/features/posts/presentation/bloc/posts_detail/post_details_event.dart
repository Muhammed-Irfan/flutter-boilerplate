part of 'post_details_bloc.dart';

@freezed
class PostDetailsEvent with _$PostDetailsEvent {
  const factory PostDetailsEvent.fetchDetails(String id) = _FetchDetails;
  const factory PostDetailsEvent.refresh(String id) = _Refresh;
} 
