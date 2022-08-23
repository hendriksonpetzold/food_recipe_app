import 'package:hive/hive.dart';
part 'recipe_model.g.dart';

@HiveType(typeId: 0)
class RecipeModel extends HiveObject {
  @HiveField(0)
  String recipeName;

  @HiveField(1)
  String preparationMode;

  @HiveField(2)
  List<String> ingridients;
  RecipeModel({
    required this.recipeName,
    required this.preparationMode,
    required this.ingridients,
  });
}
