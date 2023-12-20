import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/base/network/network_manager.dart';
import '../../../../product/base/model/index.dart';
import '../../../../product/base/service/index.dart';
import '../../../../product/state/index.dart';

class CityItems extends StatelessWidget {
  const CityItems({
    super.key,
    required this.index,
  });
  final int index;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
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
        await context.read<CurrentCityNotifier>().changeCurrentCity(
            city: context.read<CityListNotifier>().cities?[index] ?? City(),
            service: weatherService,
            unit: context.read<HeatUnitNotifier>().currentUnit);
      },
      child: Card(
        child: ListTile(
            leading: Text(
                context.read<CityListNotifier>().cities?[index].name ?? "")),
      ),
    );
  }
}
