import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:easy_logger/easy_logger.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:weather_app_case_study/product/init/cache/app_cache.dart';
import 'package:weather_app_case_study/product/state/city_list_notifier.dart';
import 'package:weather_app_case_study/product/state/current_city_notifier.dart';
import 'package:weather_app_case_study/product/state/heat_unit_notifier.dart';

@immutable
final class ApplicationInitialize {
  final List<SingleChildWidget> providers = [
    ChangeNotifierProvider<HeatUnitNotifier>(
      create: (context) => HeatUnitNotifier(),
    ),
    ChangeNotifierProvider<CityListNotifier>(
      create: (context) => CityListNotifier(),
    ),
    ChangeNotifierProvider<CurrentCityNotifier>(
      create: (context) => CurrentCityNotifier(),
    ),
  ];

  /// project basic required initialize
  Future<void> make() async {
    WidgetsFlutterBinding.ensureInitialized();

    await runZonedGuarded<Future<void>>(
      _initialize,
      (error, stack) {
        Logger().e(error);
      },
    );
  }

  /// This method is used to initialize the application process
  static Future<void> _initialize() async {
    await EasyLocalization.ensureInitialized();
    await AppCache.instance.setUp();
    EasyLocalization.logger.enableLevels = [LevelMessages.error];
    await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    FlutterError.onError = (details) {
      Logger().e(details.exceptionAsString());
    };
  }
}
