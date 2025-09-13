import 'package:hackathon/src/domain/entities/image.dart';

class CategoryEntity {
  final String id;
  final String title;
  final String? description;
  final ImageEntity? image;

  CategoryEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.image,
  });
}
