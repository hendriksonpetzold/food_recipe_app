import 'package:flutter/material.dart';
import 'package:food_recipe_app/models/rating_model.dart';
import 'package:food_recipe_app/models/rating_model.dart';
import 'package:food_recipe_app/models/recipe_model.dart';
import 'package:food_recipe_app/pages/create_my_recipes/components/create_my_recipes_category_list_view.dart';
import 'package:food_recipe_app/pages/create_my_recipes/components/create_my_recipes_custom_drop_down_form_field.dart';
import 'package:food_recipe_app/pages/create_my_recipes/components/create_my_recipes_ingridients_list_view.dart';
import 'package:food_recipe_app/pages/create_my_recipes/components/create_my_recipes_text_form_field.dart';
import 'package:food_recipe_app/repository/repository.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class CreateMyRecipesController extends GetxController {
  GlobalKey<FormState> stepOneformKey = GlobalKey<FormState>();
  GlobalKey<FormState> stepTwoformKey = GlobalKey<FormState>();
  GlobalKey<FormState> stepThreeformKey = GlobalKey<FormState>();
  TextEditingController nameEditingController = TextEditingController();
  TextEditingController ingredientsEditingController = TextEditingController();
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
                      return 'Adicione um ingrediente';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                CreateMyRecipesTextFormField(
                  controller: descriptionEditingController,
                  label: 'Descrição',
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
                ),
                const SizedBox(
                  height: 16,
                ),
                CreateMyRecipesTextFormField(
                  controller: preparationTimeEditingController,
                  label: 'Tempo para preparo',
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
                  },
                  controller: ingredientsEditingController,
                  label: 'Adicione os ingredientes',
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Adicione um ingrediente';
                    }
                    return null;
                  },
                  suffix: GestureDetector(
                    onTap: () {
                      if (stepThreeformKey.currentState!.validate()) {
                        ingridients.add(ingredientsEditingController.text);
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
              Text('Nome da receita: ${nameEditingController.text}'),
              Text('Ingredientes: ${ingridients.join(',')}'),
              Text('Modo de preparo: ${preparationModeEditingController.text}'),
              Text(
                  'Tempo de preparo: ${preparationTimeEditingController.text}'),
              Text('Categoria: ${categoryNames.join(',')}'),
              Text('Descrição: ${descriptionEditingController.text}'),
            ],
          ),
        ),
      ];

  void onFinishButtonTap() {
    myRecipesBox.put(
      nameEditingController.text,
      RecipeModel(
        id: 2,
        recipeName: nameEditingController.text,
        preparationMode: preparationModeEditingController.text,
        ingridients: ingridients,
        category: categoryNames,
        description: descriptionEditingController.text,
        preparationTime: DateTime.parse(preparationTimeEditingController.text),
        rating: RatingModel(rating: 5, valid: true),
        createdAt: DateTime.now(),
        isFavorite: false,
      ),
    );
  }
}
