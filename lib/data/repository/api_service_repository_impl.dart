import 'package:food_list/data/remote/api.dart';
import 'package:food_list/domain/repository/api_service_repository.dart';

/// API Service implementation
class APIServiceRepositoryImpl with APIServiceRepository {
  /// Want service paramater
  APIServiceRepositoryImpl(this.service);

  /// Service instance
  APIService service;

  @override
  Future<List<String>> getFoodsListNormalMenu() {
    return service.getFoodsListNormalMenu();
  }

  @override
  Future<String> getNormalMenuName() {
    return service.getNormalMenuName();
  }
}
