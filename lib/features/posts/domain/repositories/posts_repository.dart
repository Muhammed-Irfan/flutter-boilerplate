import 'package:flutter_starter/core/types/result.dart';
import 'package:flutter_starter/features/posts/domain/entities/post_entity.dart';

abstract class PostsRepository {
  Future<Result<List<PostEntity>>> getPosts();
  Future<Result<PostEntity>> getPostById(String id);
}
