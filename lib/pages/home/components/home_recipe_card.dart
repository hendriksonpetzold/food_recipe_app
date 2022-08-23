import 'package:flutter/material.dart';
import 'package:food_recipe_app/pages/home/components/favorite_button.dart';
import 'package:food_recipe_app/style/app_colors.dart';
import 'package:get/get.dart';

class HomeRecipeCard extends StatelessWidget {
  final String recipeName;
  final RxBool isFavorite;
  final void Function()? onFavoriteButtonTap;
  const HomeRecipeCard({
    Key? key,
    required this.recipeName,
    required this.isFavorite,
    required this.onFavoriteButtonTap,
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
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
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
          FavoriteButton(
            isFavorite: isFavorite,
            onFavoriteButtonTap: onFavoriteButtonTap,
          ),
        ],
      ),
    );
  }
}
