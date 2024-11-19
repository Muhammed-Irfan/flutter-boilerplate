import 'package:flutter/material.dart';
import 'package:flutter_starter/core/router/route_names.dart';
import 'package:go_router/go_router.dart';

class PostListItem extends StatelessWidget {
  final int id;
  final String title;

  const PostListItem({
    required this.id,
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      onTap: () {
        // Using named route
        context.pushNamed(
          RouteNames.details,
          pathParameters: {'id': id.toString()},
        );
      },
    );
  }
}
