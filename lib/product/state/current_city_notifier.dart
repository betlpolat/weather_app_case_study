import 'package:flutter/material.dart';
import 'package:weather_app_case_study/product/base/model/cities.dart';
import 'package:weather_app_case_study/product/base/service/weather_service.dart';

import '../base/model/weather.dart';

class CurrentCityNotifier extends ChangeNotifier {
  City? currentCity;
  bool isLoading = false;
  Weather? weather = Weather();

  Future<void> changeCurrentCity(
      {required City city,
      required IWeatherService service,
      required String unit}) async {
    _changeIsLoading();
    if (city != City()) {
      currentCity = city;
    }

    weather = await service.fetchWeather(unit);

    _changeIsLoading();
    notifyListeners();
  }

  Future<void> callWeatherService(
      {required IWeatherService service, required String unit}) async {
    _changeIsLoading();

    weather = await service.fetchWeather(unit);

    _changeIsLoading();
    notifyListeners();
  }

  void _changeIsLoading() {
    isLoading = !isLoading;
    notifyListeners();
  }
}
