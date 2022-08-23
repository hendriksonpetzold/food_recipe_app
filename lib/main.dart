import 'package:flutter/material.dart';
import 'package:food_recipe_app/app.dart';
import 'package:food_recipe_app/models/recipe_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(RecipeModelAdapter());
  await Hive.openBox<RecipeModel>('favorite_recipes');
  runApp(const App());
}
