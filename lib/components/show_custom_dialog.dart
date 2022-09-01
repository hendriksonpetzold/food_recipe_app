import 'package:flutter/material.dart';
import 'package:food_recipe_app/components/custom_dialog.dart';

void showCustomDialog(
  BuildContext context, {
  void Function()? onConfirmButtonTap,
}) {
  showDialog(
    context: context,
    builder: (context) {
      return CustomDialog(
        onConfirmButtonTap: onConfirmButtonTap,
      );
    },
  );
}
