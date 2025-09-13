// Pagination model to represent paginated data
class PaginatedResult<T> {
  final List<T> items;
  final bool hasNextPage;
  final PaginatedRequest request;

  PaginatedResult({
    required this.items,
    required this.hasNextPage,
    required this.request,
  });

  PaginatedRequest nextPage() {
    return request.nextPage();
  }
}

class PaginatedRequest {
  final int page;
  final int pageSize;

  PaginatedRequest({required this.page, required this.pageSize})
    : assert(page >= 0, 'Page must be non-negative'),
      assert(pageSize > 0, 'Page size must be positive');

  PaginatedRequest nextPage() {
    return PaginatedRequest(page: page + 1, pageSize: pageSize);
  }

  int get skip => page * pageSize;
  int get take => pageSize;

  bool get isFirstPage => page == 0;
}
