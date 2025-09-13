import 'package:hackathon/src/design/widget/error_card.dart';
import 'package:hackathon/src/presentation/shared/paginate/paginate_controller.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class PaginateWidget<NotifierT extends PaginateNotifier<T>, T>
    extends ConsumerWidget {
  final PaginateNotifierProvider<NotifierT, T> provider;

  /// The builder for list items.
  final ItemWidgetBuilder<T> itemBuilder;

  /// The builder for a no items list indicator.
  final WidgetBuilder? noItemsFoundIndicatorBuilder;
  final Axis scrollDirection;
  final EdgeInsets? padding;
  const PaginateWidget({
    super.key,
    required this.provider,
    required this.itemBuilder,
    this.noItemsFoundIndicatorBuilder,
    this.scrollDirection = Axis.vertical,
    this.padding,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(provider.notifier);
    final pagingState = ref.watch(provider);

    return PagedListView(
      state: pagingState,
      fetchNextPage: controller.fetchNextPage,
      scrollDirection: scrollDirection,
      builderDelegate: PagedChildBuilderDelegate(
        itemBuilder: itemBuilder,
        firstPageErrorIndicatorBuilder: (context) => ErrorCard(
          error: pagingState.error.toString(),
          isLoading: pagingState.isLoading,
          onRetry: () => controller.retry(),
        ),
        noItemsFoundIndicatorBuilder:
            noItemsFoundIndicatorBuilder ??
            (context) => const SizedBox.shrink(),
        firstPageProgressIndicatorBuilder: (context) =>
            Center(child: CircularProgressIndicator()),
      ),
      padding: padding,
    );
  }
}
