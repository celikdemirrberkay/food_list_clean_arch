import '../../data/repository/api_service_repository_impl.dart';

class GetNormalMenuName {
  GetNormalMenuName(this.repository);
  APIServiceRepositoryImpl repository;

  Future<String> call() async {
    return repository.getNormalMenuName();
  }
}
