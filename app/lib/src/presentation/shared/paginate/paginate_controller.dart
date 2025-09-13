import 'dart:async';

import 'package:hackathon/src/core/utils/log.dart';
import 'package:hackathon/src/domain/model/paginate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:meta/meta.dart';

typedef PaginateNotifierProvider<NotifierT extends PaginateNotifier<T>, T> =
    AutoDisposeNotifierProvider<NotifierT, PagingState<PaginatedRequest, T>>;

abstract class PaginateNotifier<T>
    extends AutoDisposeNotifier<PagingState<PaginatedRequest, T>> {
  @override
  PagingState<PaginatedRequest, T> build() {
    return PagingState();
  }

  @internal
  Future<PaginatedResult<T>> fetchPage(PaginatedRequest request);

  /// Resets the pagination state and loads the first page
  Future<void> refresh() async {
    state = PagingState();
    await fetchNextPage();
  }

  /// Retries the last failed request
  Future<void> retry() async {
    if (state.error != null) {
      await fetchNextPage();
    }
  }

  Future<void> fetchNextPage() async {
    final currentState = state;
    if (currentState.isLoading) return;

    state = currentState.copyWith(isLoading: true, error: null);

    try {
      final newKey =
          (state.keys?.last.nextPage()) ??
          PaginatedRequest(page: 0, pageSize: 20);

      logger.info(
        "Fetching page ${newKey.page} with pageSize ${newKey.pageSize}",
      );

      final newItems = await fetchPage(newKey);

      final isEmpty = newItems.items.isEmpty;

      logger.info(
        "Received ${newItems.items.length} items, hasNextPage: ${newItems.hasNextPage}",
      );

      state = state.copyWith(
        pages: [...?state.pages, if (!isEmpty) newItems.items],
        keys: [...?state.keys, if (!isEmpty) newKey],
        hasNextPage: newItems.hasNextPage,
        isLoading: false,
      );
    } catch (error, stackTrace) {
      logger.error("Error fetching page", error, stackTrace);
      state = currentState.copyWith(error: error, isLoading: false);
    }
  }
}
