import 'package:flutter/material.dart';

class CreateMyRecipesTextFormField extends StatelessWidget {
  final String label;
  final TextEditingController? controller;
  final Widget? suffix;
  final void Function(String)? onFieldSubmitted;
  final String? Function(String?)? validator;
  final int? maxLines;
  const CreateMyRecipesTextFormField({
    Key? key,
    required this.label,
    this.controller,
    this.suffix,
    this.onFieldSubmitted,
    this.validator,
    this.maxLines = 1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onFieldSubmitted: onFieldSubmitted,
      controller: controller,
      validator: validator,
      maxLines: maxLines,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        hintText: label,
        suffixIcon: suffix,
      ),
    );
  }
}
