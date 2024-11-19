import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_starter/core/di/injection.dart';
import 'package:flutter_starter/features/posts/presentation/bloc/post_bloc.dart';
import 'package:flutter_starter/features/posts/presentation/widgets/error_view.dart';
import 'package:flutter_starter/features/posts/presentation/widgets/loading_view.dart';
import 'package:flutter_starter/features/posts/presentation/widgets/some_list_item.dart';

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
      body: BlocBuilder<PostsBloc, PostsState>(
        builder: (context, state) {
          return state.when(
            loading: () => const LoadingView(),
            loaded: (data) => RefreshIndicator(
              onRefresh: () async {
                context.read<PostsBloc>().add(const PostsEvent.fetchData());
              },
              child: ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return SomeListItem(id: data[index].id, title: data[index].title);
                },
              ),
            ),
            error: (message) => ErrorView(
              message: message,
              onRetry: () {
                context.read<PostsBloc>().add(const PostsEvent.fetchData());
              },
            ),
          );
        },
      ),
    );
  }
}
