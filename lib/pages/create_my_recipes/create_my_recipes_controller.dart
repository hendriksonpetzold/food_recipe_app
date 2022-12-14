import 'package:flutter/material.dart';
import 'package:food_recipe_app/models/rating_model.dart';

import 'package:food_recipe_app/models/recipe_model.dart';
import 'package:food_recipe_app/pages/create_my_recipes/components/create_my_recipes_category_list_view.dart';
import 'package:food_recipe_app/pages/create_my_recipes/components/create_my_recipes_custom_drop_down_form_field.dart';
import 'package:food_recipe_app/pages/create_my_recipes/components/create_my_recipes_ingridients_list_view.dart';
import 'package:food_recipe_app/pages/create_my_recipes/components/create_my_recipes_text_form_field.dart';
import 'package:food_recipe_app/repository/repository.dart';
import 'package:food_recipe_app/style/app_colors.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class CreateMyRecipesController extends GetxController {
  GlobalKey<FormState> stepOneformKey = GlobalKey<FormState>();
  GlobalKey<FormState> stepTwoformKey = GlobalKey<FormState>();
  GlobalKey<FormState> stepThreeformKey = GlobalKey<FormState>();
  TextEditingController nameEditingController = TextEditingController();
  TextEditingController ingridientsEditingController = TextEditingController();
  TextEditingController descriptionEditingController = TextEditingController();
  TextEditingController preparationModeEditingController =
      TextEditingController();
  TextEditingController preparationTimeEditingController =
      TextEditingController();
  TextEditingController categoryEditingController = TextEditingController();
  late Box<RecipeModel> myRecipesBox;
  Repository repository = Repository();
  RxList<String> ingridients = RxList([]);
  RxInt currentStep = RxInt(0);
  RxList<String> allCategoryNames = RxList([]);
  RxList<String> categoryNames = RxList([]);

  @override
  void onInit() {
    myRecipesBox = Hive.box('my_recipes');
    fetchCategory();
    super.onInit();
  }

  Future<void> fetchCategory() async {
    final listCatregory = await repository.findAllCategories();

    for (var category in listCatregory) {
      allCategoryNames.add(category.name);
    }
  }

  void onStepContinue() {
    final isLastStep = currentStep.value == getSteps().length - 1;
    if (isLastStep) {
      onFinishButtonTap();
      Get.back();
    } else if (currentStep.value == 0 &&
        stepOneformKey.currentState!.validate()) {
      currentStep.value += 1;
    } else if (currentStep.value == 1 &&
        stepTwoformKey.currentState!.validate()) {
      currentStep.value += 1;
    } else if (currentStep.value == 2 &&
        stepThreeformKey.currentState!.validate()) {
      currentStep.value += 1;
    }
  }

  void onStepCancel() {
    if (currentStep.value == 0) {
      null;
    } else {
      currentStep.value -= 1;
    }
  }

  List<Step> getSteps() => [
        Step(
          state: currentStep.value > 0 ? StepState.complete : StepState.indexed,
          isActive: currentStep.value >= 0,
          title: Container(),
          content: Form(
            key: stepOneformKey,
            child: Column(
              children: [
                CreateMyRecipesTextFormField(
                  controller: nameEditingController,
                  label: 'Nome da sua receita',
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Coloque o nome da receita';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                CreateMyRecipesTextFormField(
                  controller: descriptionEditingController,
                  label: 'Descri????o',
                ),
                const SizedBox(
                  height: 16,
                ),
                Obx(() {
                  return CreateMyRecipesCustomDropDownFormField(
                    items: allCategoryNames.value,
                    onChanged: (newValue) {
                      categoryNames.add(newValue!);
                    },
                  );
                }),
                const CreateMyRecipesCategoryListView(),
              ],
            ),
          ),
        ),
        Step(
          state: currentStep.value > 1 ? StepState.complete : StepState.indexed,
          isActive: currentStep.value >= 1,
          title: Container(),
          content: Form(
            key: stepTwoformKey,
            child: Column(
              children: [
                CreateMyRecipesTextFormField(
                  controller: preparationModeEditingController,
                  label: 'Modo de preparo',
                  maxLines: null,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Coloque o modo de preparo';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                CreateMyRecipesTextFormField(
                  controller: preparationTimeEditingController,
                  label: 'Tempo para preparo(em minutos)',
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Coloque o tempo de preparo';
                    }
                    return null;
                  },
                ),
              ],
            ),
          ),
        ),
        Step(
          state: currentStep.value > 2 ? StepState.complete : StepState.indexed,
          isActive: currentStep.value >= 2,
          title: Container(),
          content: Form(
            key: stepThreeformKey,
            child: Column(
              children: [
                CreateMyRecipesTextFormField(
                  onFieldSubmitted: (text) {
                    ingridients.add(text);
                    ingridientsEditingController.clear();
                  },
                  controller: ingridientsEditingController,
                  label: 'Adicione os ingredientes',
                  validator: (value) {
                    if (ingridients.isEmpty) {
                      return 'Adicione um ingrediente';
                    }
                    return null;
                  },
                  suffix: GestureDetector(
                    onTap: () {
                      if (ingridientsEditingController.text.isNotEmpty) {
                        ingridients.add(ingridientsEditingController.text);
                        ingridients.toSet().toList();
                        ingridientsEditingController.clear();
                        stepThreeformKey.currentState!.reset();
                      }
                    },
                    child: const Icon(
                      Icons.add,
                    ),
                  ),
                ),
                const CreateMyRecipesIngridientsListView(),
              ],
            ),
          ),
        ),
        Step(
          isActive: currentStep.value >= 3,
          title: Container(),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  style: const TextStyle(
                    color: AppColors.textColor,
                    fontSize: 16,
                  ),
                  children: [
                    const TextSpan(
                      text: 'Nome da receita: ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(text: nameEditingController.text),
                  ],
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              RichText(
                text: TextSpan(
                  style: const TextStyle(
                    color: AppColors.textColor,
                    fontSize: 16,
                  ),
                  children: [
                    const TextSpan(
                      text: 'Ingredientes: ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(text: ingridients.join(',')),
                  ],
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              RichText(
                text: TextSpan(
                  style: const TextStyle(
                    color: AppColors.textColor,
                    fontSize: 16,
                  ),
                  children: [
                    const TextSpan(
                      text: 'Modo de preparo: ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(text: preparationModeEditingController.text),
                  ],
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              RichText(
                text: TextSpan(
                  style: const TextStyle(
                    color: AppColors.textColor,
                    fontSize: 16,
                  ),
                  children: [
                    const TextSpan(
                      text: 'Tempo de preparo: ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(text: preparationTimeEditingController.text),
                  ],
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              RichText(
                text: TextSpan(
                  style: const TextStyle(
                    color: AppColors.textColor,
                    fontSize: 16,
                  ),
                  children: [
                    const TextSpan(
                      text: 'Categoria: ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(text: categoryNames.join(',')),
                  ],
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              RichText(
                text: TextSpan(
                  style: const TextStyle(
                    color: AppColors.textColor,
                    fontSize: 16,
                  ),
                  children: [
                    const TextSpan(
                      text: 'Descri????o: ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(text: descriptionEditingController.text),
                  ],
                ),
              ),
            ],
          ),
        ),
      ];

  void onFinishButtonTap() {
    myRecipesBox.put(
      nameEditingController.text,
      RecipeModel(
        id: 0,
        recipeName: nameEditingController.text,
        preparationMode: preparationModeEditingController.text,
        ingridients: ingridients,
        category: categoryNames,
        description: descriptionEditingController.text,
        preparationTime: DateTime(2022).add(Duration(
            minutes: int.parse(preparationTimeEditingController.text))),
        rating: RatingModel(rating: 5, valid: true),
        createdAt: DateTime.now(),
        isFavorite: false,
      ),
    );
  }
}
