import 'package:hackathon/src/domain/entities/category.dart';
import 'package:hackathon/src/domain/entities/image.dart';

sealed class BaseCollection {
  const BaseCollection();
}

class SliderCollection extends BaseCollection {
  final List<ContentSourceEntity> content;

  const SliderCollection({required this.content});
}

class HorizontalCollection extends BaseCollection {
  final String title;
  final List<ContentSourceEntity> content;

  const HorizontalCollection({required this.title, required this.content});
}

class ChannelCollection extends BaseCollection {}

class MatchesCollection extends BaseCollection {}

class CategoryCollection extends BaseCollection {}

class ContentSourceEntity {
  final String id;
  final String title;
  final String description;
  final ImageEntity image;
  final bool isPremium;
  final List<CategoryEntity> category;
  final String? meta;
  final ContentType type;
  final String? titleType;

  const ContentSourceEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.image,
    required this.category,
    required this.isPremium,
    this.meta,
    required this.type,
    this.titleType,
  });
}

enum ContentType { movie, series, catchup, sport, documentary, tvShow, other }
