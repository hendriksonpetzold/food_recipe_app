import 'package:flutter/material.dart';

import 'package:food_recipe_app/style/app_colors.dart';

class RecipeCard extends StatelessWidget {
  final String recipeName;
  final Widget? suffix;
  const RecipeCard({
    Key? key,
    required this.recipeName,
    this.suffix,
  }) : super(key: key);

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
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            recipeName,
            style: const TextStyle(
              color: AppColors.textColor,
              fontWeight: FontWeight.w600,
            ),
          ),
          suffix != null ? suffix! : Container()
        ],
      ),
    );
  }
}
