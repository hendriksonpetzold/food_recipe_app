import 'dart:convert';

import 'package:food_recipe_app/enums/recipe_type_enum.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class CategoryModel {
  int id;
  String name;
  String createdAt;
  RecipeTypeEnum? recipeEnum;
  CategoryModel({
    required this.id,
    required this.name,
    required this.createdAt,
    this.recipeEnum,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'createdAt': createdAt,
    };
  }

  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      id: map['ID'] as int,
      name: map['Name'] as String,
      createdAt: map['CreatedAt'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CategoryModel.fromJson(String source) =>
      CategoryModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'CategoryModel(id: $id, name: $name, createdAt: $createdAt)';
}
