import 'package:flutter_starter/core/types/result.dart';
import 'package:flutter_starter/core/usecases/usecase.dart';
import 'package:flutter_starter/features/posts/domain/entities/post_entity.dart';
import 'package:flutter_starter/features/posts/domain/repositories/posts_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetPosts implements UseCase<List<PostEntity>, NoParams> {
  final PostsRepository repository;

  GetPosts(this.repository);

  @override
  Future<Result<List<PostEntity>>> call(NoParams params) => repository.getPosts();
}
