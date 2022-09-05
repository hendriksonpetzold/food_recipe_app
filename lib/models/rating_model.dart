import 'dart:convert';

import 'package:hive/hive.dart';

part 'rating_model.g.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
@HiveType(typeId: 1)
class RatingModel {
  @HiveField(0)
  int rating;
  @HiveField(1)
  bool valid;
  RatingModel({
    required this.rating,
    required this.valid,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'rating': rating,
      'valid': valid,
    };
  }

  factory RatingModel.fromMap(Map<String, dynamic> map) {
    return RatingModel(
      rating: map['Int32'] as int,
      valid: map['Valid'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory RatingModel.fromJson(String source) =>
      RatingModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'RatingModel(rating: $rating, valid: $valid)';
}
