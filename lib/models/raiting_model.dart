import 'dart:convert';

import 'package:hive/hive.dart';

part 'raiting_model.g.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
@HiveType(typeId: 1)
class RaitingModel {
  @HiveField(0)
  int raiting;
  @HiveField(1)
  bool valid;
  RaitingModel({
    required this.raiting,
    required this.valid,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'raiting': raiting,
      'valid': valid,
    };
  }

  factory RaitingModel.fromMap(Map<String, dynamic> map) {
    return RaitingModel(
      raiting: map['raiting'] as int,
      valid: map['valid'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory RaitingModel.fromJson(String source) =>
      RaitingModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
