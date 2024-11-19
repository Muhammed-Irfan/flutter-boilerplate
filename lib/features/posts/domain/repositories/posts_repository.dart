import 'package:flutter_starter/core/error/exceptions.dart';
import 'package:flutter_starter/features/posts/domain/entities/post_entity.dart';
import 'package:fpdart/fpdart.dart';

abstract class PostsRepository {
  Future<Either<AppException, List<PostEntity>>> getPosts();
  Future<Either<AppException, PostEntity>> getPostById(String id);
}
