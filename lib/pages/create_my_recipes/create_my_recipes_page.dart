import 'package:flutter/material.dart';

import 'package:food_recipe_app/pages/create_my_recipes/create_my_recipes_controller.dart';

import 'package:food_recipe_app/style/app_colors.dart';
import 'package:get/get.dart';

class CreateMyRecipesPage extends StatelessWidget {
  CreateMyRecipesPage({Key? key}) : super(key: key);
  final CreateMyRecipesController controller =
      Get.put(CreateMyRecipesController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      appBar: AppBar(
        title: const Text(
          'Crie a sua receita',
          style: TextStyle(
            color: AppColors.textColor,
          ),
        ),
        leading: BackButton(
          color: AppColors.textColor,
          onPressed: () {
            Get.back();
          },
        ),
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: AppColors.backGroundColor,
        elevation: 0,
      ),
      body: Form(
        child: Obx(
          () {
            return Theme(
              data: Theme.of(context).copyWith(
                colorScheme:
                    const ColorScheme.light(primary: AppColors.accentColor),
              ),
              child: Stepper(
                  elevation: 0,
                  type: StepperType.horizontal,
                  steps: controller.getSteps(),
                  currentStep: controller.currentStep.value,
                  onStepContinue: () {
                    final isLastStep = controller.currentStep.value ==
                        controller.getSteps().length - 1;
                    if (isLastStep) {
                      controller.onFinishButtonTap();
                      Get.back();
                    } else {
                      controller.currentStep.value += 1;
                    }
                  },
                  onStepCancel: controller.currentStep.value == 0
                      ? null
                      : () {
                          controller.currentStep.value -= 1;
                        },
                  onStepTapped: (step) => controller.currentStep.value = step,
                  controlsBuilder: (context, detail) {
                    final isLastStep = controller.currentStep.value ==
                        controller.getSteps().length - 1;
                    return Container(
                      margin: const EdgeInsets.only(top: 50),
                      child: Row(
                        children: [
                          if (controller.currentStep.value != 0)
                            Expanded(
                              child: ElevatedButton(
                                onPressed: detail.onStepCancel,
                                child: const Text('Voltar'),
                              ),
                            ),
                          if (controller.currentStep.value != 0)
                            const SizedBox(
                              width: 8,
                            ),
                          Expanded(
                            child: ElevatedButton(
                              onPressed: detail.onStepContinue,
                              child: Text(isLastStep ? 'Finalizar' : 'Próximo'),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
            );
          },
        ),
      ),
    );
  }
}
