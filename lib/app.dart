import 'package:flutter/material.dart';
import 'package:food_recipe_app/config/routes.dart';
import 'package:get/get.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Recipe Food',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      getPages: Routes.routes,
    );
  }
}
