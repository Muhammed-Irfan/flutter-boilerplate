import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_starter/core/usecases/usecase.dart';
import 'package:flutter_starter/features/posts/domain/entities/post_entity.dart';
import 'package:flutter_starter/features/posts/domain/usecases/get_posts.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'post_bloc.freezed.dart';
part 'post_event.dart';
part 'post_state.dart';

@injectable
class PostsBloc extends Bloc<PostsEvent, PostsState> {
  final GetPosts _getPosts;

  PostsBloc(this._getPosts) : super(const PostsState.loading()) {
    on<PostsEvent>((event, emit) async {
      await event.map(
        fetchData: (e) async => _onFetchData(e, emit),
      );
    });
  }

  Future<void> _onFetchData(_FetchData event, Emitter<PostsState> emit) async {
    emit(const PostsState.loading());
    final result = await _getPosts(const NoParams());
    result.fold(
      (failure) => emit(PostsState.error(failure.message)),
      (data) => emit(PostsState.loaded(data)),
    );
  }
}
