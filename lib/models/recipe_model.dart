// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:hive/hive.dart';

part 'recipe_model.g.dart';

@HiveType(typeId: 0)
class RecipeModel extends HiveObject {
  @HiveField(0)
  int id;

  @HiveField(1)
  String recipeName;

  @HiveField(2)
  String preparationMode;

  @HiveField(3)
  List<String> ingridients;

  @HiveField(4)
  List<String> category;

  @HiveField(5)
  String description;

  @HiveField(6)
  double preparationTime;

  @HiveField(7)
  int rating;

  @HiveField(8)
  int createdAt;

  @HiveField(9)
  bool isFavorite;

  RecipeModel({
    required this.id,
    required this.recipeName,
    required this.preparationMode,
    required this.ingridients,
    required this.category,
    required this.description,
    required this.preparationTime,
    required this.rating,
    required this.createdAt,
    required this.isFavorite,
  });

  RecipeModel copyWith({
    int? id,
    String? recipeName,
    String? preparationMode,
    List<String>? ingridients,
    List<String>? category,
    String? description,
    double? preparationTime,
    int? rating,
    int? createdAt,
    bool? isFavorite,
  }) {
    return RecipeModel(
      id: id ?? this.id,
      recipeName: recipeName ?? this.recipeName,
      preparationMode: preparationMode ?? this.preparationMode,
      ingridients: ingridients ?? this.ingridients,
      category: category ?? this.category,
      description: description ?? this.description,
      preparationTime: preparationTime ?? this.preparationTime,
      rating: rating ?? this.rating,
      createdAt: createdAt ?? this.createdAt,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }
}
