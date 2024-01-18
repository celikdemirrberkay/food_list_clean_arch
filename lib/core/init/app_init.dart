import '../../data/dependencyinjection/injection_container.dart';

class AppInit {
  static Future<void> init() async {
    await setup();
  }
}
