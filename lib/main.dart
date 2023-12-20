import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app_case_study/feature/bottom_bar/view/bottom_bar_view.dart';
import 'package:weather_app_case_study/product/init/application_initialize.dart';
import 'package:weather_app_case_study/product/init/theme/custom_light_theme.dart';

import 'product/init/localization_initialize.dart';

Future<void> main() async {
  await ApplicationInitialize().make();

  runApp(ProductLocalization(
    child: MultiProvider(
      providers: ApplicationInitialize().providers,
      builder: (context, child) => const _MyApp(),
    ),
  ));
}

class _MyApp extends StatelessWidget {
  const _MyApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App Case Study',
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: CustomLightTheme().themeData,
      home: const BottomBarView(),
    );
  }
}
