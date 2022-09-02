// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

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
  DateTime preparationTime;

  @HiveField(7)
  int? rating;

  @HiveField(8)
  DateTime createdAt;

  @HiveField(9)
  bool? isFavorite;

  RecipeModel({
    required this.id,
    required this.recipeName,
    required this.preparationMode,
    required this.ingridients,
    required this.category,
    required this.description,
    required this.preparationTime,
    this.rating,
    required this.createdAt,
    this.isFavorite,
  });

  RecipeModel copyWith({
    int? id,
    String? recipeName,
    String? preparationMode,
    List<String>? ingridients,
    List<String>? category,
    String? description,
    DateTime? preparationTime,
    int? rating,
    DateTime? createdAt,
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

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'recipeName': recipeName,
      'preparationMode': preparationMode,
      'ingridients': ingridients,
      'category': category,
      'description': description,
      'preparationTime': preparationTime,
      'rating': rating,
      'createdAt': createdAt,
    };
  }

  factory RecipeModel.fromMap(Map<String, dynamic> map) {
    return RecipeModel(
      id: map['ID'] as int,
      recipeName: map['Name'] as String,
      preparationMode: map['PrepareMethod'] as String,
      ingridients: List<String>.from((map['Ingredients'])),
      category: List<String>.from((map['Categories'])),
      description: map['Description'] as String,
      preparationTime: DateTime.parse(map['PreparationTime'].toString()),
      // rating: map['Rating'] as int,
      createdAt: DateTime.parse(map['CreatedAt'].toString()),
    );
  }

  String toJson() => json.encode(toMap());

  factory RecipeModel.fromJson(String source) =>
      RecipeModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'RecipeModel(id: $id, recipeName: $recipeName, preparationMode: $preparationMode, ingridients: $ingridients, category: $category, description: $description, preparationTime: $preparationTime, rating: $rating, createdAt: $createdAt, isFavorite: $isFavorite)';
  }
}
