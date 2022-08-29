import 'package:flutter/material.dart';

class CreateMyRecipesTextFormField extends StatelessWidget {
  final String label;
  final TextEditingController? controller;
  final Widget? suffix;
  final void Function(String)? onFieldSubmitted;
  const CreateMyRecipesTextFormField(
      {Key? key,
      required this.label,
      this.controller,
      this.suffix,
      this.onFieldSubmitted})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onFieldSubmitted: onFieldSubmitted,
      controller: controller,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        hintText: label,
        suffixIcon: suffix,
      ),
    );
  }
}
