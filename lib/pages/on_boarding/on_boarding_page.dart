import 'package:flutter/material.dart';
import 'package:food_recipe_app/components/app_button.dart';
import 'package:food_recipe_app/style/app_colors.dart';
import 'package:food_recipe_app/style/app_images.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * .65,
            width: double.infinity,
            color: AppColors.backGroundColor,
            child: Image(
              image: AssetImage(AppImages.onBoarding),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(
              bottom: 32,
            ),
            width: MediaQuery.of(context).size.width * .65,
            height: MediaQuery.of(context).size.height * .3,
            child: Column(
              children: [
                Text(
                  'Cozinhe como um chefe',
                  style: GoogleFonts.montserrat(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                const Text(
                  'Varias receitas para você impressionar o seu paladar',
                ),
                Expanded(child: Container()),
                AppButton(
                  circularBorder: 30,
                  isSelected: RxBool(true),
                  label: 'Iniciar',
                  onTap: () {
                    Get.toNamed('/home_page');
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
