import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_starter/features/posts/domain/entities/post_entity.dart';
import 'package:flutter_starter/features/posts/domain/usecases/get_post_details.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'post_details_cubit.freezed.dart';
part 'post_details_state.dart';

@injectable
class PostDetailsCubit extends Cubit<PostDetailsState> {
  final GetPostDetails _getPostDetails;

  PostDetailsCubit(this._getPostDetails)
      : super(const PostDetailsState.loading());

  Future<void> fetchPostDetails(String id) async {
    emit(const PostDetailsState.loading());
    final result = await _getPostDetails(id);
    result.fold(
      (failure) => emit(PostDetailsState.error(failure.message)),
      (post) => emit(PostDetailsState.loaded(post)),
    );
  }
}
