import 'package:flutter/material.dart';
import 'package:food_recipe_app/style/app_colors.dart';
import 'package:get/get.dart';

class FavoriteButton extends StatelessWidget {
  const FavoriteButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    RxBool isFavorite = RxBool(false);

    return InkWell(
      onTap: () {
        isFavorite.value = !isFavorite.value;
      },
      child: Obx(
        () {
          return Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            child: isFavorite.value
                ? const Icon(
                    Icons.favorite,
                    color: AppColors.accentColor,
                  )
                : const Icon(
                    Icons.favorite_outline,
                    color: AppColors.accentColor,
                  ),
          );
        },
      ),
    );
  }
}
