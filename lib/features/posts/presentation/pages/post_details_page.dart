import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_starter/core/di/injection.dart';
import 'package:flutter_starter/features/posts/presentation/cubit/post_details_cubit.dart';
import 'package:flutter_starter/features/posts/presentation/widgets/error_view.dart';
import 'package:flutter_starter/features/posts/presentation/widgets/loading_view.dart';

class PostDetailsPage extends StatelessWidget {
  final String postId;

  const PostDetailsPage({
    required this.postId,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<PostDetailsCubit>()..fetchPostDetails(postId),
      child: PostDetailsView(postId: postId),
    );
  }
}

class PostDetailsView extends StatelessWidget {
  final String postId;

  const PostDetailsView({required this.postId, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Post Details'),
      ),
      body: BlocBuilder<PostDetailsCubit, PostDetailsState>(
        builder: (context, state) {
          return state.when(
            loading: () => const LoadingView(),
            loaded: (post) => SingleChildScrollView(
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
            ),
            error: (message) => ErrorView(
              message: message,
              onRetry: () {
                context.read<PostDetailsCubit>().fetchPostDetails(postId);
              },
            ),
          );
        },
      ),
    );
  }
}
