import 'package:flutter/material.dart';
import 'package:food_recipe_app/models/recipe_model.dart';
import 'package:food_recipe_app/pages/create_my_recipes/components/create_my_recipes_ingridients_list_view.dart';
import 'package:food_recipe_app/pages/create_my_recipes/components/create_my_recipes_text_form_field.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class CreateMyRecipesController extends GetxController {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController nameEditingController = TextEditingController();
  TextEditingController ingredientsEditingController = TextEditingController();
  TextEditingController descriptionEditingController = TextEditingController();
  TextEditingController preparationModeEditingController =
      TextEditingController();
  TextEditingController preparationTimeEditingController =
      TextEditingController();
  TextEditingController categoryEditingController = TextEditingController();
  RxList<String> ingridients = RxList([]);
  late Box<RecipeModel> myRecipesBox;
  RxInt currentStep = RxInt(0);

  @override
  void onInit() {
    myRecipesBox = Hive.box('my_recipes');

    super.onInit();
  }

  List<Step> getSteps() => [
        Step(
          state: currentStep.value > 0 ? StepState.complete : StepState.indexed,
          isActive: currentStep.value >= 0,
          title: Container(),
          content: Column(
            children: [
              CreateMyRecipesTextFormField(
                controller: nameEditingController,
                label: 'Nome da sua receita',
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
              CreateMyRecipesTextFormField(
                controller: categoryEditingController,
                label: 'Categoria',
              ),
            ],
          ),
        ),
        Step(
          state: currentStep.value > 1 ? StepState.complete : StepState.indexed,
          isActive: currentStep.value >= 1,
          title: Container(),
          content: Column(
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
        Step(
          state: currentStep.value > 2 ? StepState.complete : StepState.indexed,
          isActive: currentStep.value >= 2,
          title: Container(),
          content: Column(
            children: [
              CreateMyRecipesTextFormField(
                onFieldSubmitted: (text) {
                  ingridients.add(text);
                },
                controller: ingredientsEditingController,
                label: 'Adicione os ingredientes',
                suffix: GestureDetector(
                  onTap: () {
                    ingridients.add(ingredientsEditingController.text);
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
        Step(
          isActive: currentStep.value >= 3,
          title: Container(),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Nome da receita: ${nameEditingController.text}'),
              Text('Ingredientes: $ingridients'),
              Text('Modo de preparo: ${preparationModeEditingController.text}'),
              Text(
                  'Tempo de preparo: ${preparationTimeEditingController.text}'),
              Text('Categoria: ${categoryEditingController.text}'),
              Text('Descrição: ${descriptionEditingController.text}'),
            ],
          ),
        ),
      ];

  void onFinishButtonTap() {
    myRecipesBox.add(
      RecipeModel(
        id: 2,
        recipeName: nameEditingController.text,
        preparationMode: preparationModeEditingController.text,
        ingridients: ingridients,
        category: [],
        description: descriptionEditingController.text,
        preparationTime: double.parse(preparationTimeEditingController.text),
        rating: 5,
        createdAt: 6,
        isFavorite: false,
      ),
    );
  }
}
