import 'package:food_recipe_app/enums/bottom_bar_pages_enum.dart';

import 'package:get/get.dart';

class InitialController extends GetxController {
  final Rx<BottomBarPagesEnum> _activePage =
      Rx<BottomBarPagesEnum>(BottomBarPagesEnum.home);

  BottomBarPagesEnum get activePage => _activePage.value;

  void changePage(BottomBarPagesEnum page) {
    _activePage.value = page;
  }

  RxBool checkActivePage({required BottomBarPagesEnum page}) {
    if (page == _activePage.value) return RxBool(true);
    return RxBool(false);
  }

  int getPageIndex() {
    switch (_activePage.value) {
      case BottomBarPagesEnum.home:
        return 0;

      case BottomBarPagesEnum.favorite:
        return 1;

      case BottomBarPagesEnum.myRecipes:
        return 2;

      case BottomBarPagesEnum.profile:
        return 3;

      default:
        return 0;
    }
  }
}
