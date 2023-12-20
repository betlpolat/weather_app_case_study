import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../utility/enum/lottie_items.dart';

class LoadingLottie extends StatelessWidget {
  const LoadingLottie({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(child: Lottie.asset(LottieItems.loading.lottiePath));
  }
}
