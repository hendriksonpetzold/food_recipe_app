import 'package:flutter/material.dart';
import 'package:food_recipe_app/pages/search_recipes/components/serach_recipes_search_form_field.dart';
import 'package:food_recipe_app/style/app_colors.dart';

class SearchRecipesPage extends StatelessWidget {
  const SearchRecipesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: const Text(
          'Procure por receitas',
          style: TextStyle(
            color: AppColors.textColor,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        elevation: 1,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: const [
            SearchRecipesSearchFormField(),
          ],
        ),
      ),
    );
  }
}
