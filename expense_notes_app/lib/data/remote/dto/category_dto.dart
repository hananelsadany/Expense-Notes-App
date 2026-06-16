// category_dto.dart
import 'package:expense_notes_app/data/model/category_model.dart';

class CategoryDto {
  final String slug;
  final String name;

  CategoryDto({
    required this.slug,
    required this.name,
  });

  factory CategoryDto.fromJson(Map<String, dynamic> json) {
    return CategoryDto(
      slug: json['slug'],
      name: json['name'],
    );
  }

  CategoryModel toModel() {
    return CategoryModel(
      uuid: slug,
      name: name,
    );
  }
}