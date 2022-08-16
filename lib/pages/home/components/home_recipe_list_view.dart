import 'package:flutter/material.dart';
import 'package:food_recipe_app/pages/home/components/home_recipe_card.dart';

class HomeRecipeListView extends StatelessWidget {
  const HomeRecipeListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return Column(
            children: [
              GestureDetector(
                onTap: () {},
                child: const HomeRecipeCard(),
              ),
              const SizedBox(
                height: 8,
              ),
            ],
          );
        },
      ),
    );
  }
}
