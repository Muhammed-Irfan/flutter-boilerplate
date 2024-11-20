import 'package:flutter_starter/core/error/exceptions.dart';
import 'package:flutter_starter/core/utils/safety_utils.dart';
import 'package:flutter_starter/features/posts/data/datasources/remote/posts_remote_datasource.dart';
import 'package:flutter_starter/features/posts/data/models/posts_model.dart';
import 'package:flutter_starter/features/posts/domain/entities/post_entity.dart';
import 'package:flutter_starter/features/posts/domain/repositories/posts_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: PostsRepository)
class PostsRepositoryImpl implements PostsRepository {
  final PostsRemoteDataSource remoteDataSource;

  PostsRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<AppException, List<PostEntity>>> getPosts() {
    return executeSafelyWithMapping(
      remoteDataSource.getPosts,
      (models) => models.map((model) => model.toEntity()).toList(),
    );
  }

  @override
  Future<Either<AppException, PostEntity>> getPostById(String id) {
    return executeSafelyWithMapping(
      () => remoteDataSource.getPostById(id),
      (model) => model.toEntity(),
    );
  }
}
