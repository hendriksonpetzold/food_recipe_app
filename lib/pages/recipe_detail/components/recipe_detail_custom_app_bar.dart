import 'package:flutter/material.dart';

import 'package:food_recipe_app/style/app_colors.dart';
import 'package:get/get.dart';

class RecipeDetailCustomAppBar extends StatelessWidget {
  final String title;
  final Widget action;

  const RecipeDetailCustomAppBar({
    Key? key,
    required this.title,
    required this.action,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: double.infinity,
      color: AppColors.backGroundColor,
      child: Row(
        children: [
          BackButton(
            onPressed: () {
              Get.back();
            },
          ),
          Text(title),
          action,
        ],
      ),
    );
  }
}
