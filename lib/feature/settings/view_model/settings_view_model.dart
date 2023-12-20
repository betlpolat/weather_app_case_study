import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app_case_study/feature/settings/view/widget/unit_option_button.dart';

import '../../../core/base/network/network_manager.dart';
import '../../../product/base/service/index.dart';
import '../../../product/state/index.dart';

mixin SettingsViewModel on State<UnitOptionButton> {
  Future<void> changeUnit() async {
    context.read<HeatUnitNotifier>().changeUnit();
    IWeatherService weatherService = WeatherService(
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
    await context.read<CurrentCityNotifier>().callWeatherService(
        service: weatherService,
        unit: context.read<HeatUnitNotifier>().currentUnit);
  }
}
