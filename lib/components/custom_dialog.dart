import 'package:flutter/material.dart';
import 'package:food_recipe_app/components/app_button.dart';
import 'package:get/get.dart';

class CustomDialog extends Dialog {
  final void Function()? onConfirmButtonTap;
  CustomDialog({
    Key? key,
    this.onConfirmButtonTap,
  }) : super(
          key: key,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Container(
            height: 150,
            width: 200,
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Tem certeza que deseja excluir?',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                Row(
                  children: [
                    Expanded(
                      child: AppButton(
                        height: 40,
                        label: 'Cancelar',
                        onTap: () {
                          Get.back();
                        },
                        isSelected: RxBool(true),
                        margin: EdgeInsets.zero,
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      child: AppButton(
                        height: 40,
                        label: 'Confirmar',
                        onTap: onConfirmButtonTap,
                        isSelected: RxBool(true),
                        margin: EdgeInsets.zero,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
}
