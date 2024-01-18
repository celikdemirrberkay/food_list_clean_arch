import 'package:food_list/core/constants/network_constants.dart';
import 'package:html/dom.dart' as dom;
import 'package:http/http.dart' as http;

/// API service for fetching html data
class APIService {
  /// Fetch food list name.
  /// For ex. "Normal Menu"
  Future<String> getNormalMenuName() async {
    /// We take food list url and response
    final url = Uri.parse(NetworkConstants.foodListURI);
    final response = await http.get(url);
    final html = dom.Document.html(response.body);

    /// We take food title as a list and then we take the first element.
    /// ----> This is like ["Normal Menu"]
    final foodTitle = html
        .querySelectorAll('#wrapper > div > section.muContent > div > div > div > article > div > div:nth-child(1) > div:nth-child(1) > h4')
        .map((e) => e.innerHtml.trim())
        .toList()
        .first;

    return foodTitle;
  }

  /// Fetch food list normal menu
  Future<List<String>> getFoodsListNormalMenu() async {
    /// We take food list url and response
    final url = Uri.parse(NetworkConstants.foodListURI);
    final response = await http.get(url);
    final html = dom.Document.html(response.body);

    /// We take foods as a [List]
    final foodsListTemp = html.querySelectorAll('.list-dashed>li').map((e) => e.innerHtml.trim()).toList();

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
