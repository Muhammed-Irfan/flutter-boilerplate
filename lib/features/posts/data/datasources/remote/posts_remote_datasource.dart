import 'package:flutter_starter/core/types/result.dart';
import 'package:flutter_starter/core/utils/safety_utils.dart';
import 'package:flutter_starter/features/posts/data/datasources/remote/post_api_client.dart';
import 'package:flutter_starter/features/posts/data/models/posts_model.dart';
import 'package:injectable/injectable.dart';

abstract class PostsRemoteDataSource {
  Future<Result<List<PostModel>>> getPosts();
  Future<Result<PostModel>> getPostById(String id);
}

@Injectable(as: PostsRemoteDataSource)
class PostsRemoteDataSourceImpl implements PostsRemoteDataSource {
  final PostsApiClient _apiClient;

  PostsRemoteDataSourceImpl(this._apiClient);

  @override
  Future<Result<List<PostModel>>> getPosts() {
    return executeSafelyAndRetrieveResponseData(_apiClient.getPosts);
  }

  @override
  Future<Result<PostModel>> getPostById(String id) {
    return executeSafelyAndRetrieveResponseData(() => _apiClient.getPostById(id));
  }
}
