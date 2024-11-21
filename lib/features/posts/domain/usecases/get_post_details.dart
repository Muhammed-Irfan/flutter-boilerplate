import 'package:flutter_starter/core/types/result.dart';
import 'package:flutter_starter/core/usecases/usecase.dart';
import 'package:flutter_starter/features/posts/domain/entities/post_entity.dart';
import 'package:flutter_starter/features/posts/domain/repositories/posts_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetPostDetails implements UseCase<PostEntity, String> {
  final PostsRepository repository;

  GetPostDetails(this.repository);

  @override
  Future<Result<PostEntity>> call(String id) => repository.getPostById(id);
}
