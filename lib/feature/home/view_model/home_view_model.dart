import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/base/network/network_manager.dart';
import '../../../product/base/model/weather.dart';
import '../../../product/base/service/weather_service.dart';
import '../../../product/state/index.dart';
import '../view/home_view.dart';

mixin HomeViewModel on State<HomeView> {
  final GlobalKey<NavigatorState> key = GlobalKey<NavigatorState>();

  late Future<Weather?> weather;
  late IWeatherService weatherService;

  @override
  void initState() {
    weatherService = WeatherService(
        NetworkManager.instance.service,
        context
                .read<CurrentCityNotifier>()
                .currentCity
                ?.coordinates
                ?.latitude ??
            0.0,
        context
                .read<CurrentCityNotifier>()
                .currentCity
                ?.coordinates
                ?.latitude ??
            0.0);
    weather = weatherService
        .fetchWeather(context.read<HeatUnitNotifier>().currentUnit);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }
}
