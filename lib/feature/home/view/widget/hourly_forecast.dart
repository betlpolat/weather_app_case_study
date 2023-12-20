import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app_case_study/core/extension/index.dart';

import '../../../../product/init/language/locale_keys.g.dart';
import '../../../../product/state/current_city_notifier.dart';

class HourlyForecast extends StatefulWidget {
  const HourlyForecast({super.key});

  @override
  State<HourlyForecast> createState() => _HourlyForecastState();
}

class _HourlyForecastState extends State<HourlyForecast> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _textHourlyForecast(context),
        SizedBox(
          width: context.width,
          height: context.highValue,
          child: ListView.builder(
              itemCount: 12,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return _hourlyItems(context, index);
              }),
        ),
      ],
    );
  }

  Card _hourlyItems(BuildContext context, int index) {
    return Card(
      margin: context.paddingLow,
      child: Container(
        margin: context.paddingLowHorizontal,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text((context
                        .watch<CurrentCityNotifier>()
                        .weather
                        ?.hourly
                        ?.time?[index] ??
                    "")
                .toString()),
            const Icon(Icons.cloud),
            Text(
              "${context.watch<CurrentCityNotifier>().weather?.hourly?.temperature2m?[index] ?? ""} ${context.watch<CurrentCityNotifier>().weather?.currentUnits?.temperature2m ?? ""} ",
            )
          ],
        ),
      ),
    );
  }

  Text _textHourlyForecast(BuildContext context) {
    return Text(
      LocaleKeys.home_hourly_forecast.locale,
      style: context.textTheme.titleMedium,
    );
  }
}
