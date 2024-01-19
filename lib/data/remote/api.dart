import 'package:food_list/core/constants/network_constants.dart';
import 'package:food_list/core/enum/html_selector_enum.dart';
import 'package:html/dom.dart' as dom;
import 'package:http/http.dart' as http;

//TODOS: Get normal menu usage. We take the value but we dont use it
//TODOS: Get vegie menu
//TODOS: Add model like --> Food

/// API service for fetching html data
class APIService {
  APIService({required this.client});
  final http.Client client;

  /// Fetch food list name.
  /// For ex. "Normal Menu"
  Future<String> getNormalMenuName() async {
    /// We take food list url and response
    final url = Uri.parse(NetworkConstants.foodListURI);
    final response = await client.get(url);
    final html = dom.Document.html(response.body);

    /// We take food title as a list and then we take the first element.
    /// ----> This is like ["Normal Menu"]
    final foodTitle = html.querySelectorAll(HtmlSelector.normalMenuName.value).map((e) => e.innerHtml.trim()).toList().first;

    return foodTitle;
  }

  /// Fetch food list normal menu
  Future<List<String>> getFoodsListNormalMenu() async {
    /// We take food list url and response
    final url = Uri.parse(NetworkConstants.foodListURI);
    final response = await client.get(url);
    final html = dom.Document.html(response.body);

    /// We take foods as a [List]
    final foodsListTemp = html.querySelectorAll(HtmlSelector.normalMenuList.value).map((e) => e.innerHtml.trim()).toList();

    /// Seperate foods and calories
    final foodsList = _parseMealsAndCaloriesAndTakeJustFoodNames(foodsListTemp);

    /// Returning food list
    return foodsList;
  }

  ///As per HTML Parser, we receive our data with calorie values.
  ///However, we only want to get the food names. We separate calories with this method.
  List<String> _parseMealsAndCaloriesAndTakeJustFoodNames(List<String> list) {
    /// Temporary list
    final tempList = <String>[];

    ///Check and seperate meals and calories
    for (final item in list) {
      if (int.tryParse(item) is! int) {
        tempList.add(item);
      }
    }

    /// Return just food names
    return tempList;
  }
}
