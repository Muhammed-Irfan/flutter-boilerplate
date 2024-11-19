import 'package:flutter_starter/features/posts/domain/entities/post_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'posts_model.freezed.dart';
part 'posts_model.g.dart';

@freezed
class PostModel with _$PostModel {
  const factory PostModel({
    required int userId,
    required int id,
    required String title,
    required String body,
  }) = _PostModel;

  factory PostModel.fromJson(Map<String, dynamic> json) => _$PostModelFromJson(json);
}

extension PostModelToDomain on PostModel {
  PostEntity toEntity() => PostEntity(
        id: id,
        title: title,
        description: body,
      );
}
