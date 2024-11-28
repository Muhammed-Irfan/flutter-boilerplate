import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_starter/core/bloc/base_bloc.dart';
import 'package:flutter_starter/core/bloc/base_bloc_state.dart';
import 'package:flutter_starter/core/models/navigation_result.dart';
import 'package:flutter_starter/shared/presentation/widgets/loading_view.dart';
import 'package:go_router/go_router.dart';

enum SnackBarType {
  success,
  error,
  info,
}

class BaseView<B extends BaseBloc<dynamic, T>, T> extends StatelessWidget {
  final Widget Function(T data) onLoaded;
  final Widget? loadingWidget;
  final Widget? initialWidget;
  final Widget Function(String message)? onError;
  final void Function(NavigationResult navigation)? onNavigate;
  final void Function(String message, SnackBarType type)? onShowSnackBar;

  const BaseView({
    required this.onLoaded,
    super.key,
    this.loadingWidget,
    this.initialWidget,
    this.onError,
    this.onNavigate,
    this.onShowSnackBar,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<B, BaseState<T>>(
      listener: (context, state) {
        state.maybeWhen(
          navigate: (navigation) {
            if (onNavigate != null) {
              onNavigate!(navigation);
            } else {
              _handleDefaultNavigation(context, navigation);
            }
          },
          error: (message) {
            _showSnackBar(context, message, SnackBarType.error);
          },
          orElse: () {},
        );
      },
      child: BlocBuilder<B, BaseState<T>>(
        builder: (context, state) {
          return state.map(
            initial: (_) => _buildInitial(),
            loading: (_) => _buildLoading(),
            loaded: (state) => onLoaded(state.data),
            error: (state) => _buildError(state.message),
            navigate: (_) => const SizedBox.shrink(),
          );
        },
      ),
    );
  }

  void _handleDefaultNavigation(BuildContext context, NavigationResult navigation) {
    if (navigation.message != null) {
      _showSnackBar(context, navigation.message!, SnackBarType.success);
    }

    if (navigation.routeName != null) {
      context.goNamed(
        navigation.routeName!,
        pathParameters: navigation.pathParams ?? {},
        queryParameters: navigation.queryParams ?? {},
        extra: navigation.extra,
      );
    } else {
      context.pop(navigation.extra);
    }
  }

  void _showSnackBar(BuildContext context, String message, SnackBarType type) {
    if (onShowSnackBar != null) {
      onShowSnackBar!(message, type);
      return;
    }

    final snackBar = SnackBar(
      content: Text(message),
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.all(8),
      backgroundColor: _getSnackBarColor(type),
      action: type == SnackBarType.error
          ? SnackBarAction(
              label: 'Dismiss',
              textColor: Colors.white,
              onPressed: () {
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
              },
            )
          : null,
      duration: type == SnackBarType.error ? const Duration(seconds: 5) : const Duration(seconds: 2),
    );

    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }

  Color _getSnackBarColor(SnackBarType type) {
    switch (type) {
      case SnackBarType.success:
        return Colors.green;
      case SnackBarType.error:
        return Colors.red;
      case SnackBarType.info:
        return Colors.blue;
    }
  }

  Widget _buildInitial() {
    if (initialWidget != null) {
      return initialWidget!;
    }
    return const SizedBox.shrink();
  }

  Widget _buildLoading() {
    if (loadingWidget != null) {
      return loadingWidget!;
    }
    return const LoadingView();
  }

  Widget _buildError(String message) {
    if (onError != null) {
      return onError!(message);
    }
    return ErrorWidget(message);
  }
}
