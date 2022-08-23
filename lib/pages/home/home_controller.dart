import 'package:flutter/cupertino.dart';
import 'package:food_recipe_app/enums/recipe_type_enum.dart';
import 'package:food_recipe_app/models/recipe_model.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class HomeController extends GetxController {
  final TextEditingController searchEditingController = TextEditingController();
  final Rx<RecipeTypeEnum> _activeList = Rx<RecipeTypeEnum>(RecipeTypeEnum.all);
  late Box<RecipeModel> recipeBox;
  RecipeTypeEnum get activeList => _activeList.value;

  @override
  void onInit() {
    recipeBox = Hive.box('favorite');

    super.onInit();
  }

  void onFavoriteButtonTap({required RxBool isFavorite, required int index}) {
    isFavorite.value = !isFavorite.value;
    final list = recipe[index];
    if (isFavorite.value == true) {
      recipeBox.put(
        list.id,
        RecipeModel(
          recipeName: list.recipeName,
          preparationMode: list.preparationMode,
          ingridients: list.ingridients,
          id: list.id,
          isFavorite: list.isFavorite,
          rating: list.rating,
          preparationTime: list.preparationTime,
          category: list.category,
          createdAt: list.createdAt,
          description: list.description,
        ),
      );
    } else {
      recipeBox.delete(list.id);
    }
  }

  void changeList({required RecipeTypeEnum list}) {
    _activeList.value = list;
  }

  RxBool checkActiveList({required RecipeTypeEnum list}) {
    if (list == _activeList.value) return RxBool(true);
    return RxBool(false);
  }

  void getListByGenre() {
    switch (_activeList.value) {
      case RecipeTypeEnum.all:
        break;
      case RecipeTypeEnum.sweet:
        break;

      case RecipeTypeEnum.breakFast:
        break;

      case RecipeTypeEnum.dinner:
        break;

      case RecipeTypeEnum.italyFood:
        break;

      case RecipeTypeEnum.lunch:
        break;

      case RecipeTypeEnum.japaneseFood:
        break;
      default:
    }
  }

  List<RecipeModel> recipe = [
    RecipeModel(
      recipeName: 'Canjica',
      preparationMode: '''
1- Coloque a canjica em uma tigela, cubra com água e deixe de molho por algumas horas.
2- Escorra a água, coloque a canjica na panela de Pressão Elétrica Mondial, coloque água, canela e cravo e tampe.
3- Coloque a válvula em pressurizar e programe para contar 40 minutos. 
4- Quando apitar, coloque a válvula em liberar para sair a pressão, abra a panela e usando a função refogar, adicione o açúcar, o leite e o leite de coco.
5- Por fim, junte as raspas de laranja e quando engrossar, está pronto.
''',
      ingridients: [
        '1 xícara de canjica',
        '1 xícara de leite',
        '200ml de leite de coco',
        '1/2 xícara de açucar',
        'Canela em pau',
        'Cravo',
        'Raspas de 1 laranja',
      ],
      id: 0,
      isFavorite: false,
      rating: 0,
      preparationTime: 0,
      category: [],
      createdAt: 0,
      description: '',
    ),
    RecipeModel(
      recipeName: 'Bolo de laranja da vovó',
      preparationMode: '''
1- Na Batedeira Mondial, bata as clara em neve e reserve.
2- Bata as gemas com o açúcar na Batedeira Mondial e adicione as claras em neve.
3- Junte uma xicara de suco de laranja processado no Espremedor Mondial, a farinha e o fermento, misturando tudo muito bem. 
4- Despeje em uma forma untada e polvilhada.
5- Leve ao forno e asse a 180 ° a 200 ° por cerca de 30 min.
6- Despeje a outra xícara de suco de laranja no bolo ainda quente e sirva.
''',
      ingridients: [
        '2 xícaras de açucar',
        '2 xícaras de farinha de trigo',
        '1 colher de sopa de fermento em pó',
        '2 xícaras de suco de laranja',
        '4 ovos',
      ],
      id: 1,
      isFavorite: false,
      rating: 0,
      preparationTime: 0,
      category: [],
      createdAt: 0,
      description: '',
    ),
    RecipeModel(
      recipeName: 'Creme de milho',
      preparationMode: '''
1- No liquidificador bata a metade do milho com o leite e o trigo.
2- Em uma panela aqueça a manteiga e doure a cebola.
3- Junte a outra metade do milho, tempere com sal e pimenta e adicione a batida no Liquidificador Mondial. 
4- Mexa até engrossar.
''',
      ingridients: [
        '1 lata de milho',
        '1 xícara de leite',
        '1 colher de sopa de farinha de trigo',
        '1 colher de sopa de manteiga',
        '1/2½ xícara de cebola picada',
        'Sal',
        'Pimenta',
      ],
      id: 2,
      isFavorite: false,
      rating: 0,
      preparationTime: 0,
      category: [],
      createdAt: 0,
      description: '',
    ),
    RecipeModel(
      recipeName: 'Maçã do amor',
      preparationMode: '''
1- Espete os palitos nas maçãs e reserve.
2- Coloque todos os ingredientes na panela do Fondue Elétrico Mondial e misture muito bem, ligue e ajuste para uma temperatura média/baixa e não mexa mais por cerca de 15 a 20 minutos.
3- Quando a calda estiver mais grossa teste para ver se está no ponto, pegue um pouco com uma colher e pingue essa calda em um potinho com água, se ficar dura imediatamente estará boa, caso desmanche e derreta na água precisa apurar mais. 
4- Quando a calda estiver no ponto abaixe a temperatura para o mínimo, apenas para manter aquecido e comece a passar as maçãs.
5- Faça uma maça por vez e vá colocando sobre um pedaço de papel manteiga ou assadeira untados para esfriar e endurecer.
''',
      ingridients: [
        '12 maçãs em temperatura ambiente',
        '12 palitos',
        '500g de açúcar comum',
        '250ml de água',
        '20ml de vinagre de álcool ou de maçã',
        '15g de corante alimentício vermelho',
        '1 colher de café de baunilha',
        '1/2 colher de café de canela em pó',
        '1 pitada de cravo em pó',
      ],
      id: 3,
      isFavorite: false,
      rating: 0,
      preparationTime: 0,
      category: [],
      createdAt: 0,
      description: '',
    ),
    RecipeModel(
      recipeName: 'Caldo de feijão',
      preparationMode: '''
1- Comece colocando o azeite, cebola e alho na Panela de Pressão Elétrica Mondial.
2- Refogue utilizando a função de Refogar, em seguida acrescente a linguiça e o bacon, refogue e dê uma leve fritada, depois reserve a linguiça, o bacon e parte deste refogado.
3- Agora acrescente o feijão, cheiro verde, louro, sal e pimenta a gosto e a água. Tampe a panela, coloque a válvula na posição de pressão e programe na função de Feijão, ajustando o tempo para 40 minutos.
4- Quando este tempo terminar, retire a pressão lentamente, abra a panela, retire as folhas de louro e processe tudo com ajuda do mixer de mão Mondial.
5- Acrescente ao itens que refogou e reservou, com mais um pouco de cheiro verde, misture bem e deixe ferver por cerca de 5 minutos.
6- Sirva decorando com pedacinhos de bacon, linguiça, couve refogada, torresmo ou cebolinha frita.
''',
      ingridients: [
        '2 colheres de sopa de azeite',
        '1/2 cebola picada',
        '2 dentes de alho amassados',
        '1 gomo de linguiça calabresa fatiada',
        '50g de Bacon picado',
        '250g de feijão cru',
        'Cheiro verde a gosto',
        '2 folhas de louro',
        'Sal e pimenta a gosto',
        '1 litro de água',
      ],
      id: 4,
      isFavorite: false,
      rating: 0,
      preparationTime: 0,
      category: [],
      createdAt: 0,
      description: '',
    ),
  ];
}
