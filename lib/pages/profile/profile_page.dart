import 'package:flutter/material.dart';
import 'package:food_recipe_app/components/avatar_image.dart';
import 'package:food_recipe_app/pages/profile/components/profile_menu_button.dart';
import 'package:food_recipe_app/pages/profile/components/sign_out_button.dart';
import 'package:food_recipe_app/pages/profile/profile_controller.dart';
import 'package:food_recipe_app/style/app_colors.dart';

import 'package:get/get.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({Key? key}) : super(key: key);
  final ProfileController controller = Get.put(ProfileController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backGroundColor,
        title: const Text(
          'Perfil',
          style: TextStyle(
            color: AppColors.textColor,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 56,
                  ),
                  const AvatarImage(
                    height: 120,
                    width: 120,
                    userProfileImage:
                        'https://img.freepik.com/free-vector/businessman-character-avatar-isolated_24877-60111.jpg?w=2000',
                  ),
                  const SizedBox(
                    height: 56,
                  ),
                  const Text(
                    'Hendrikson Petzold',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  ProfileMenuButton(
                    onPressed: () {},
                    icon: Icons.restaurant,
                    label: 'Pedidos',
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  ProfileMenuButton(
                    onPressed: () {},
                    icon: Icons.pin_drop,
                    label: 'Endereços',
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(),
            ),
            Align(
              alignment: const Alignment(0, 0),
              child: SignOutButton(
                onPressed: () {},
              ),
            ),
            const SizedBox(
              height: 24,
            ),
          ],
        ),
      ),
    );
  }
}
