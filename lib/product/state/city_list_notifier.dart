import 'package:flutter/material.dart';
import 'package:weather_app_case_study/product/base/model/cities.dart';

import '../../core/base/network/network_manager.dart';
import '../base/service/city_service.dart';

class CityListNotifier extends ChangeNotifier {
  List<City>? cities = [];
  final ICityService _cityService =
      CityService(NetworkManager.instance.service);
  bool isLoading = false;

  Future<void> fetchCities() async {
    _changeIsLoading();
    if (cities!.isEmpty || cities == [] || cities == null) {
      cities = await _cityService.fetchCity();
    }

    _changeIsLoading();
    notifyListeners();
  }

  void _changeIsLoading() {
    isLoading = !isLoading;
    notifyListeners();
  }
}
