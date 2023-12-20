import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app_case_study/core/extension/context_extension.dart';
import 'package:weather_app_case_study/product/state/heat_unit_notifier.dart';

import '../../../core/base/network/network_manager.dart';
import '../../../product/base/service/weather_service.dart';
import '../../../product/state/current_city_notifier.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: context.paddingLow,
          child: InkWell(
            onTap: () async {
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
            },
            child: Card(
                child: ListTile(
              leading: Text(
                "Birim Tercihi",
                style: context.textTheme.titleSmall,
              ),
              trailing: Text(
                context.watch<HeatUnitNotifier>().currentUnit,
                style: context.textTheme.titleLarge,
              ),
            )),
          ),
        )
      ],
    );
  }
}
