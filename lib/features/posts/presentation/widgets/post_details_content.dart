import 'package:flutter/material.dart';
import 'package:flutter_starter/features/posts/domain/entities/post_entity.dart';

class PostDetailsContent extends StatelessWidget {
  final PostEntity post;

  const PostDetailsContent({
    required this.post,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            post.title,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(height: 16),
          Text(post.description),
        ],
      ),
    );
  }
} 
