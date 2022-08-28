import 'package:flutter/material.dart';

class CreateMyRecipesTextFormField extends StatelessWidget {
  final String label;
  final TextEditingController? controller;
  final Widget? suffix;
  const CreateMyRecipesTextFormField({
    Key? key,
    required this.label,
    this.controller,
    this.suffix,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        hintText: label,
        suffixIcon: suffix,
      ),
    );
  }
}
