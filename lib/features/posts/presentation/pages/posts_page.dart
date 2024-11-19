import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_starter/core/di/injection.dart';
import 'package:flutter_starter/core/presentation/widgets/base_view.dart';
import 'package:flutter_starter/features/posts/presentation/bloc/posts_list/post_bloc.dart';
import 'package:flutter_starter/features/posts/presentation/widgets/posts_list_item.dart';

class PostsPage extends StatelessWidget {
  const PostsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<PostsBloc>()..add(const PostsEvent.fetchData()),
      child: const PostsView(),
    );
  }
}

class PostsView extends StatelessWidget {
  const PostsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Some Feature'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              context.read<PostsBloc>().add(const PostsEvent.fetchData());
            },
          ),
        ],
      ),
      body: BaseView<PostsBloc, PostState>(
        onLoaded: (state) => RefreshIndicator(
          onRefresh: () async {
            context.read<PostsBloc>().add(const PostsEvent.fetchData());
          },
          child: ListView.builder(
            itemCount: state.posts.length,
            itemBuilder: (context, index) {
              final post = state.posts[index];
              return PostListItem(
                id: post.id,
                title: post.title,
              );
            },
          ),
        ),
      ),
    );
  }
}
