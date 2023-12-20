import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app_case_study/product/state/city_list_notifier.dart';

import '../city_change_view.dart';

mixin CityChangeViewMixin on State<CityChangeView> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      callCities();
    });
  }

  Future<void> callCities() async {
    await context.read<CityListNotifier>().fetchCities();
  }
}
