mixin APIServiceRepository {
  ///Get normal menu name
  Future<String> getNormalMenuName();

  ///Get normal menu list
  Future<List<String>> getFoodsListNormalMenu();
}
