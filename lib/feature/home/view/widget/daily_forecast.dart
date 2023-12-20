import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app_case_study/core/extension/index.dart';

import '../../../../product/init/language/locale_keys.g.dart';
import '../../../../product/state/current_city_notifier.dart';

class DailyForecast extends StatefulWidget {
  const DailyForecast({super.key});

  @override
  State<DailyForecast> createState() => _DailyForecastState();
}

class _DailyForecastState extends State<DailyForecast> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _textDailyForecast(context),
        SizedBox(
          width: context.width,
          height: context.highValue,
          child: ListView.builder(
              itemCount: 7,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return _dailyItems(context, index);
              }),
        ),
      ],
    );
  }

  Card _dailyItems(BuildContext context, int index) {
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
                        ?.daily
                        ?.time?[index] ??
                    "")
                .toString()),
            const Icon(Icons.cloud),
            Text(
              "${context.watch<CurrentCityNotifier>().weather?.daily?.temperature2mMax?[index] ?? ""} ${context.watch<CurrentCityNotifier>().weather?.currentUnits?.temperature2m ?? ""} ",
            )
          ],
        ),
      ),
    );
  }

  Text _textDailyForecast(BuildContext context) {
    return Text(
      LocaleKeys.home_daily_forecast.locale,
      style: context.textTheme.titleMedium,
    );
  }
}
