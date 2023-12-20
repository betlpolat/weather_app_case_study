import 'package:flutter/material.dart';
import 'package:weather_app_case_study/product/init/cache/cache_keys.dart';
import 'package:weather_app_case_study/product/utility/enum/heat_unit.dart';

class HeatUnitNotifier extends ChangeNotifier {
  String currentUnit = CacheKeys.heatUnit.readString != ""
      ? CacheKeys.heatUnit.readString
      : HeatUnit.celsius.symbol;

  void changeUnit() {
    if (currentUnit == HeatUnit.celsius.symbol) {
      currentUnit = HeatUnit.fahrenheit.symbol;
      CacheKeys.heatUnit.writeString(HeatUnit.fahrenheit);
    } else if (currentUnit == HeatUnit.fahrenheit.symbol) {
      currentUnit = HeatUnit.celsius.symbol;
      CacheKeys.heatUnit.writeString(HeatUnit.celsius);
    }

    notifyListeners();
  }
}
