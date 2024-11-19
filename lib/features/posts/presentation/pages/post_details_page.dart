import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_starter/core/di/injection.dart';
import 'package:flutter_starter/core/presentation/widgets/base_view.dart';
import 'package:flutter_starter/features/posts/presentation/bloc/posts_detail/post_details_bloc.dart';
import 'package:flutter_starter/features/posts/presentation/widgets/post_details_content.dart';

class PostDetailsPage extends StatelessWidget {
  final String postId;

  const PostDetailsPage({
    required this.postId,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<PostDetailsBloc>()
        ..add(PostDetailsEvent.fetchDetails(postId)),
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
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              context.read<PostDetailsBloc>()
                .add(PostDetailsEvent.refresh(postId));
            },
          ),
        ],
      ),
      body: BaseView<PostDetailsBloc, PostDetailsState>(
        onLoaded: (state) => RefreshIndicator(
          onRefresh: () async {
            context.read<PostDetailsBloc>()
              .add(PostDetailsEvent.refresh(postId));
          },
          child: PostDetailsContent(post: state.post),
        ),
      ),
    );
  }
}
