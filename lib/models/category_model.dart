import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class CategoryModel {
  int id;
  String name;
  String createdAt;

  CategoryModel({
    required this.id,
    required this.name,
    required this.createdAt,
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
