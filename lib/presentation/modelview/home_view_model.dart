import 'package:food_list/domain/use_case/get_normal_food_list.dart';
import 'package:food_list/domain/use_case/get_normal_menu_name.dart';

class HomeViewViewModel {
  /// Use case instances
  GetNormalFoodListUseCase _normalFoodListUseCase;
  GetNormalMenuNameUseCase _normalMenuNameUseCase;

  HomeViewViewModel(this._normalFoodListUseCase, this._normalMenuNameUseCase);

  Future<List<String>> getNormalFoodList() async {
    return _normalFoodListUseCase.call();
  }

  Future<String> getNormalMenuName() async {
    return _normalMenuNameUseCase.call();
  }
}
