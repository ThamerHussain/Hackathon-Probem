import 'package:hackathon/src/domain/entities/home.dart';

abstract class SearchRepo {
  Future<SearchResultData> searchTitles({
    required String titleName,
    int? fromYear,
    int? toYear,
    int skip = 0,
    int take = 10,
    String? titleType,
  });
}

class SearchResultData {
  final bool hasResult;
  final int totalHits;
  final List<ContentSourceEntity> results;

  SearchResultData({
    required this.hasResult,
    required this.totalHits,
    required this.results,
  });
}
