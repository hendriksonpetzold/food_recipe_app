import 'package:flutter/material.dart';
import 'package:food_recipe_app/style/app_colors.dart';
import 'package:get/get.dart';

class CustomBottomNavigationBarIcon extends StatelessWidget {
  final IconData icon;
  final RxBool isSelected;
  final void Function()? onTap;
  const CustomBottomNavigationBarIcon({
    Key? key,
    required this.onTap,
    required this.icon,
    required this.isSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Icon(
        icon,
        size: 28,
        color: isSelected.value ? AppColors.accentColor : Colors.grey,
      ),
    );
  }
}
