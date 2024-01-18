import 'package:food_list/domain/use_case/get_normal_food_list.dart';
import 'package:food_list/domain/use_case/get_normal_menu_name.dart';

class HomeViewViewModel {
  GetNormalFoodListUseCase normalFoodListUseCase;
  GetNormalMenuNameUseCase normalMenuNameUseCase;

  HomeViewViewModel(this.normalFoodListUseCase, this.normalMenuNameUseCase);

  Future<List<String>> getNormalFoodList() async {
    return normalFoodListUseCase.call();
  }

  Future<String> getNormalMenuName() async {
    return normalMenuNameUseCase.call();
  }
}
