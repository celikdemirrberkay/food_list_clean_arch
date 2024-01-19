import 'package:food_list/data/dependencyinjection/injection_container.dart';

/// Setups required for our application to work
class AppInit {
  /// Setup function
  static Future<void> init() async {
    await setup();
  }
}
