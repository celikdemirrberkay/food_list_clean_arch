import 'package:food_list/data/repository/api_service_repository_impl.dart';

class GetNormalFoodListUseCase {
  GetNormalFoodListUseCase(this.repository);
  APIServiceRepositoryImpl repository;

  Future<List<String>> call() async {
    return repository.getFoodsListNormalMenu();
  }
}
