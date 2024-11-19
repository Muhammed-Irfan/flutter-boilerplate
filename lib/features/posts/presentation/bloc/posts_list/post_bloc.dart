import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_starter/core/bloc/base_bloc.dart';
import 'package:flutter_starter/core/bloc/base_bloc_state.dart';
import 'package:flutter_starter/core/usecases/usecase.dart';
import 'package:flutter_starter/features/posts/domain/entities/post_entity.dart';
import 'package:flutter_starter/features/posts/domain/usecases/get_posts.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'post_bloc.freezed.dart';
part 'post_event.dart';
part 'post_state.dart';

@injectable
class PostsBloc extends BaseBloc<PostsEvent, PostState> {
  final GetPosts _getPosts;

  PostsBloc(this._getPosts) : super();

  @override
  Future<void> handleEvent(PostsEvent event, Emitter<BaseState<PostState>> emit) async {
    await event.map(
      fetchData: (e) async => _onFetchData(e, emit),
    );
  }

  Future<void> _onFetchData(_FetchData event, Emitter<BaseState<PostState>> emit) async {
    emitLoading(emit);
    final result = await _getPosts(const NoParams());
    result.fold(
      (failure) => emitError(emit, failure.message),
      (data) => emitLoaded(emit, PostState(posts: data)),
    );
  }
}
