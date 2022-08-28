import 'package:flutter/material.dart';
import 'package:food_recipe_app/style/app_colors.dart';
import 'package:get/get.dart';

class AppButton extends StatelessWidget {
  final String label;
  final void Function()? onTap;
  final RxBool isSelected;
  final double width;
  final double height;
  final EdgeInsets margin;
  final double circularBorder;
  const AppButton({
    Key? key,
    required this.label,
    required this.onTap,
    required this.isSelected,
    this.width = double.infinity,
    this.height = 60,
    this.margin = const EdgeInsets.only(right: 16),
    this.circularBorder = 15,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        margin: margin,
        decoration: BoxDecoration(
          color: isSelected.value ? AppColors.accentColor : Colors.white,
          borderRadius: BorderRadius.circular(circularBorder),
          border: isSelected.value
              ? null
              : Border.all(
                  color: AppColors.accentColor,
                ),
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              color: isSelected.value ? Colors.white : AppColors.textColor,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
