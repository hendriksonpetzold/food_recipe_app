import 'package:flutter/material.dart';

import 'package:food_recipe_app/pages/home/components/home_recipe_list_view.dart';
import 'package:food_recipe_app/pages/home/components/home_search_form_field.dart';
import 'package:food_recipe_app/pages/home/components/home_select_recipe_type.dart';
import 'package:food_recipe_app/pages/home/home_controller.dart';
import 'package:food_recipe_app/style/app_colors.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final HomeController controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 24,
            left: 24,
            right: 24,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Menu de receitas',
                style: GoogleFonts.montserrat(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textColor,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              const HomeSearchFormField(),
              const SizedBox(
                height: 16,
              ),
              const Text(
                'Selecione por categoria',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textColor,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              const HomeSelectMovieTypeBar(),
              const SizedBox(
                height: 16,
              ),
              const HomeRecipeListView(),
            ],
          ),
        ),
      ),
    );
  }
}
