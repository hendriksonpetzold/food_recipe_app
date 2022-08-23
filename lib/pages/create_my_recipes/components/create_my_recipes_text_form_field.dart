import 'package:flutter/material.dart';

class CreateMyRecipesTextFormField extends StatelessWidget {
  final String label;
  final TextEditingController? controller;
  const CreateMyRecipesTextFormField({
    Key? key,
    required this.label,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        hintText: label,
      ),
    );
  }
}
