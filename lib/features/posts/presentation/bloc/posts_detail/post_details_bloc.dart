import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_starter/core/bloc/base_bloc.dart';
import 'package:flutter_starter/core/bloc/base_bloc_state.dart';
import 'package:flutter_starter/features/posts/domain/entities/post_entity.dart';
import 'package:flutter_starter/features/posts/domain/usecases/get_post_details.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'post_details_bloc.freezed.dart';
part 'post_details_event.dart';
part 'post_details_state.dart';

@injectable
class PostDetailsBloc extends BaseBloc<PostDetailsEvent, PostDetailsState> {
  final GetPostDetails _getPostDetails;

  PostDetailsBloc(this._getPostDetails) : super();

  @override
  Future<void> handleEvent(
    PostDetailsEvent event,
    Emitter<BaseState<PostDetailsState>> emit,
  ) async {
    await event.map(
      fetchDetails: (e) => _onFetchDetails(e, emit),
      refresh: (e) => _onFetchDetails(e, emit),
    );
  }

  Future<void> _onFetchDetails(
    PostDetailsEvent event,
    Emitter<BaseState<PostDetailsState>> emit,
  ) async {
    emitLoading(emit);
    final result = await _getPostDetails(event.id);
    result.fold(
      (failure) => emitError(emit, failure.message),
      (post) => emitLoaded(emit, PostDetailsState(post: post)),
    );
  }
} 
