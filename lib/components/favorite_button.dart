import 'package:flutter/material.dart';

import 'package:food_recipe_app/style/app_colors.dart';
import 'package:get/get.dart';

class FavoriteButton extends StatelessWidget {
  final RxBool isFavorite;
  final void Function()? onFavoriteButtonTap;
  const FavoriteButton({
    Key? key,
    required this.isFavorite,
    required this.onFavoriteButtonTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onFavoriteButtonTap,
      child: Obx(
        () {
          return Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
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
