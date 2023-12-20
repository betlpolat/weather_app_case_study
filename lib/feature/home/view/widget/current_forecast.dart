import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app_case_study/core/extension/context_extension.dart';

import '../../../../product/state/current_city_notifier.dart';

class CurrentForecast extends StatelessWidget {
  const CurrentForecast({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.colors.primary,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${context.watch<CurrentCityNotifier>().weather?.current?.temperature2m ?? ""} ${context.watch<CurrentCityNotifier>().weather?.currentUnits?.temperature2m ?? ""} ",
                style: context.textTheme.displayLarge,
              ),
            ],
          ),
          const Icon(Icons.cloud),
        ],
      ),
    );
  }
}
