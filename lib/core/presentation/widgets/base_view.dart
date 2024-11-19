import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_starter/core/bloc/base_bloc.dart';
import 'package:flutter_starter/core/bloc/base_bloc_state.dart';
import 'package:flutter_starter/shared/presentation/widgets/loading_view.dart';

class BaseView<B extends BaseBloc<dynamic, T>, T> extends StatelessWidget {
  final Widget Function(T data) onLoaded;
  final Widget Function(String message)? onError;
  final Widget? loadingWidget;
  final Widget? initialWidget;
  final void Function()? onRetry;

  const BaseView({
    required this.onLoaded, super.key,
    this.onError,
    this.loadingWidget,
    this.initialWidget,
    this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<B, BaseState<T>>(
      builder: (context, state) {
        return state.map(
          initial: (_) => _buildInitial(),
          loading: (_) => _buildLoading(),
          loaded: (state) => onLoaded(state.data),
          error: (state) => _buildError(state.message),
        );
      },
    );
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
