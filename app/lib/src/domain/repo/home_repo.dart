import 'package:hackathon/src/domain/entities/category.dart';
import 'package:hackathon/src/domain/entities/home.dart';

abstract class HomeRepo {
  Future<List<BaseCollection>> getCollections();
  Future<List<CategoryEntity>> getCategories();

  /// Returns seasons count for a series title. Returns `null` if not available
  /// or if the title is not a series.
  Future<int?> getSeasonsCount(String seriesId);
}
