import 'package:food_list/data/remote/api.dart';
import 'package:food_list/data/repository/api_service_repository_impl.dart';
import 'package:food_list/domain/use_case/get_normal_food_list.dart';
import 'package:food_list/domain/use_case/get_normal_menu_name.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

/// Get it object
final sl = GetIt.instance;

/// Set up singleton
Future<void> setup() async {
  /// Register API Service
  sl
    ..registerSingleton<APIService>(APIService(client: http.Client()))

    /// Register type [APIServiceRepository] [APIServiceRepositoryImpl]
    ..registerSingleton<APIServiceRepositoryImpl>(APIServiceRepositoryImpl(sl()))

    /// Register [GetNormalFoodListUseCase]
    ..registerSingleton<GetNormalFoodListUseCase>(GetNormalFoodListUseCase(sl()))

    /// Register [GetNormalMenuNameUseCase]
    ..registerSingleton<GetNormalMenuNameUseCase>(GetNormalMenuNameUseCase(sl()));
}
