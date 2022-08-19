import 'package:flutter/material.dart';
import 'package:food_recipe_app/style/app_colors.dart';

class SignOutButton extends StatelessWidget {
  final void Function()? onPressed;
  const SignOutButton({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.all(8),
        height: 30,
        width: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: AppColors.accentColor.withOpacity(0.2),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(
              Icons.logout,
              color: AppColors.accentColor,
              size: 18,
            ),
            SizedBox(
              width: 2,
            ),
            Text(
              'Sair',
              style: TextStyle(
                color: AppColors.accentColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
