import 'package:flutter_starter/core/error/exceptions.dart';
import 'package:flutter_starter/core/utils/safety_utils.dart';
import 'package:flutter_starter/features/posts/data/datasources/remote/post_api_client.dart';
import 'package:flutter_starter/features/posts/data/models/posts_model.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

abstract class PostsRemoteDataSource {
  Future<Either<AppException, List<PostModel>>> getPosts();
  Future<Either<AppException, PostModel>> getPostById(String id);
}

@Injectable(as: PostsRemoteDataSource)
class PostsRemoteDataSourceImpl implements PostsRemoteDataSource {
  final PostsApiClient _apiClient;

  PostsRemoteDataSourceImpl(this._apiClient);

  @override
  Future<Either<AppException, List<PostModel>>> getPosts() {
    return executeSafely(() async {
      final response = await _apiClient.getPosts();
      return response.data;
    });
  }

  @override
  Future<Either<AppException, PostModel>> getPostById(String id) {
    return executeSafely(() async {
      final response = await _apiClient.getPostById(id);
      return response.data;
    });
  }
}
