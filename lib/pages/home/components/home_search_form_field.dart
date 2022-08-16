import 'package:flutter/material.dart';
import 'package:food_recipe_app/pages/home/home_controller.dart';
import 'package:get/get.dart';

class HomeSearchFormField extends GetView<HomeController> {
  const HomeSearchFormField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: Row(
        children: [
          const SizedBox(
            width: 16,
          ),
          const Icon(
            Icons.search,
            size: 24,
            color: Colors.black,
          ),
          const SizedBox(
            width: 8,
          ),
          Expanded(
            child: TextFormField(
              controller: controller.searchEditingController,
              style: const TextStyle(color: Colors.black),
              cursorColor: Colors.grey,
              decoration: const InputDecoration(
                hintText: 'Procure pela receita desejada',
                isDense: true,
                border: InputBorder.none,
                hintStyle: TextStyle(color: Colors.grey),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
