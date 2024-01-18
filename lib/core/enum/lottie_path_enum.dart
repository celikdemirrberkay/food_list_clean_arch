/// Enum for lottie path
enum LottiePath {
  /// Main page lottie path
  main,
}

extension LottiePathExtension on LottiePath {
  /// Get lottie path
  String get path {
    switch (this) {
      case LottiePath.main:
        return "assets/lottie/foods.json";
    }
  }
}
