// ignore: constant_identifier_names
enum LottieItems {
  loading,
}

extension LottieItemsExtension on LottieItems {
  String get lottiePath => 'asset/lottie/lottie_$name.json';
}
