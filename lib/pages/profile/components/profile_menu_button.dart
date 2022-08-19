import 'package:flutter/material.dart';
import 'package:food_recipe_app/style/app_colors.dart';

class ProfileMenuButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final void Function()? onPressed;
  const ProfileMenuButton({
    Key? key,
    required this.icon,
    required this.label,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 60,
        child: Row(
          children: [
            Container(
              height: 45,
              width: 45,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: AppColors.accentColor.withOpacity(0.2),
              ),
              child: Icon(
                icon,
                color: AppColors.accentColor,
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            Text(
              label,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
            ),
          ],
        ),
      ),
    );
  }
}
