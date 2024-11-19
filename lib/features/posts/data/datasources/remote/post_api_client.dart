import 'package:dio/dio.dart';
import 'package:flutter_starter/features/posts/data/models/posts_model.dart';
import 'package:retrofit/retrofit.dart';

part 'post_api_client.g.dart';

@RestApi()
abstract class PostsApiClient {
  factory PostsApiClient(
    Dio dio, {
    String? baseUrl,
    ParseErrorLogger? errorLogger,
  }) = _PostsApiClient;

  @GET('/posts')
  Future<HttpResponse<List<PostModel>>> getPosts();

  @GET('/posts/{id}')
  Future<HttpResponse<PostModel>> getPostById(@Path('id') String id);
}
