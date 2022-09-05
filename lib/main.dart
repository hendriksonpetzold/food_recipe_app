import 'package:flutter/material.dart';
import 'package:food_recipe_app/app.dart';
import 'package:food_recipe_app/models/rating_model.dart';
import 'package:food_recipe_app/models/recipe_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(RecipeModelAdapter());
  Hive.registerAdapter(RatingModelAdapter());
  await Hive.openBox<RecipeModel>('favorite');
  await Hive.openBox<RecipeModel>('my_recipes');
  await Hive.openBox('category');
  await Hive.openBox('recipes');
  runApp(const App());
}
