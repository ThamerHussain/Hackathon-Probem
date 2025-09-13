import 'package:hackathon/src/design/theme/theme.dart';
import 'package:hackathon/src/design/widget/button.dart';
import 'package:hackathon/src/design/widget/error_card.dart';
import 'package:hackathon/src/domain/model/paginate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AsyncValueHandlerWidget<T> extends HookWidget {
  /// this is a wrapper widget that will handle the state of the async value
  const AsyncValueHandlerWidget({
    required this.asyncValue,
    required this.builder,
    super.key,
    this.emptyBuilder,
    this.errorBuilder,
    this.loadingBuilder,
    this.onRetry,
    this.sliver = false,
    this.bottomSheet = false,
    this.showRefreshLoading = true,
    this.showError = true,
  });
  final AsyncValue<T> asyncValue;
  final Widget Function(T data) builder;
  final Widget Function(Object error, Widget errorBuild)? errorBuilder;

  /// only works if the data is a list and empty
  final Widget Function()? emptyBuilder;
  final Widget Function()? loadingBuilder;
  final AsyncVoidCallback? onRetry;
  final bool sliver;
  final bool bottomSheet;
  // show loading when async value is loading and we also have value exist
  final bool showRefreshLoading;
  final bool showError;

  @override
  Widget build(BuildContext context) {
    Widget wrapSliver(Widget child) {
      if (sliver) {
        return SliverToBoxAdapter(child: child);
      }
      if (bottomSheet) {
        return ConstrainedBox(
          constraints: BoxConstraints(minWidth: 100),
          child: child,
        );
      }
      return child;
    }

    final errorBuilder =
        this.errorBuilder ?? (error, errorBuild) => wrapSliver(errorBuild);

    bool isEmpty(T val) {
      if (val is List) {
        return val.isEmpty;
      }
      if (val is PaginatedResult) {
        return val.items.isEmpty;
      }
      return false;
    }

    final child = switch (asyncValue) {
      AsyncLoading() => wrapSliver(
        Padding(
          padding: (context.appSpace.xs4).toAllEdgeInsets(),
          child:
              loadingBuilder?.call() ??
              const Center(child: CircularProgressIndicator()),
        ),
      ),
      AsyncData val when val.isLoading && !showRefreshLoading => wrapSliver(
        Padding(
          padding: (context.appSpace.xs4).toAllEdgeInsets(),
          child:
              loadingBuilder?.call() ??
              const Center(child: CircularProgressIndicator()),
        ),
      ),
      AsyncError(error: final error) =>
        showError
            ? errorBuilder.call(
                error,
                ErrorCard(
                  isLoading: asyncValue.isLoading,
                  error: error,
                  onRetry: asyncValue.isLoading ? null : onRetry,
                ),
              )
            : wrapSliver(const SizedBox.shrink()),
      AsyncData(value: final value)
          when emptyBuilder != null && isEmpty(value) =>
        emptyBuilder!(),
      AsyncData(value: final value) => builder(value),
      AsyncValue() => wrapSliver(const Text('...')),
    };

    return child;
  }
}
