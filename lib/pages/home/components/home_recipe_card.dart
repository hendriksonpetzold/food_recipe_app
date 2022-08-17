import 'package:flutter/material.dart';
import 'package:food_recipe_app/components/favorite_button.dart';
import 'package:food_recipe_app/style/app_colors.dart';

class HomeRecipeCard extends StatelessWidget {
  const HomeRecipeCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        left: 16,
        right: 16,
        top: 8,
        bottom: 8,
      ),
      height: 50,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Text(
            'Nome da receita',
            style: TextStyle(
              color: AppColors.textColor,
              fontWeight: FontWeight.w600,
            ),
          ),
          FavoriteButton(),
        ],
      ),
    );
  }
}
