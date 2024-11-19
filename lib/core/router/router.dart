import 'package:flutter_starter/core/di/injection.dart';
import 'package:flutter_starter/core/router/route_names.dart';
import 'package:flutter_starter/core/router/route_paths.dart';
import 'package:flutter_starter/core/services/logging/logging_service.dart';
import 'package:flutter_starter/features/posts/presentation/pages/post_details_page.dart';
import 'package:flutter_starter/features/posts/presentation/pages/posts_page.dart';
import 'package:go_router/go_router.dart';
import 'package:talker_flutter/talker_flutter.dart';

final router = GoRouter(
  initialLocation: RoutePaths.home,
  routes: [
    GoRoute(
      path: RoutePaths.home,
      name: RouteNames.home,
      builder: (context, state) => const PostsPage(),
      routes: [
        GoRoute(
          path: RoutePaths.details,
          name: RouteNames.details,
          builder: (context, state) {
            final id = state.pathParameters['id']!;
            return PostDetailsPage(postId: id);
          },
        ),
      ],
    ),
  ],
  observers: [TalkerRouteObserver(getIt<LoggingService>().talker)],
);
