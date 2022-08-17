import 'package:flutter/material.dart';
import 'package:food_recipe_app/style/app_colors.dart';

class IngridientsListView extends StatelessWidget {
  const IngridientsListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) {
        return const ListTile(
          leading: Icon(
            Icons.horizontal_rule,
            color: AppColors.accentColor,
          ),
          title: Text('Ingredientes'),
        );
      },
    );
  }
}
