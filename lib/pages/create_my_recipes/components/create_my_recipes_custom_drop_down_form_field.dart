import 'package:flutter/material.dart';
import 'package:food_recipe_app/style/app_colors.dart';

class CreateMyRecipesCustomDropDownFormField extends StatelessWidget {
  final List<String> items;
  final void Function(String?)? onChanged;
  const CreateMyRecipesCustomDropDownFormField(
      {Key? key, required this.items, required this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      decoration: const InputDecoration(border: OutlineInputBorder()),
      dropdownColor: AppColors.backGroundColor,
      isDense: true,
      items: items
          .map(
            (item) => DropdownMenuItem<String>(
              value: item,
              child: Text(
                item,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textColor,
                ),
              ),
            ),
          )
          .toList(),
      onChanged: onChanged,
    );
  }
}
