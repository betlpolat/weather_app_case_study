import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app_case_study/core/extension/context_extension.dart';
import 'package:weather_app_case_study/feature/city_change/view/mixin/city_change_view_mixin.dart';
import 'package:weather_app_case_study/product/base/model/cities.dart';
import 'package:weather_app_case_study/product/base/service/weather_service.dart';
import 'package:weather_app_case_study/product/state/city_list_notifier.dart';
import 'package:weather_app_case_study/product/state/current_city_notifier.dart';
import 'package:weather_app_case_study/product/widget/loading_lottie.dart';

import '../../../core/base/mixin/navigator_manager_mixin.dart';
import '../../../core/base/network/network_manager.dart';
import '../../../product/state/heat_unit_notifier.dart';

class CityChangeView extends StatefulWidget {
  const CityChangeView({super.key});

  @override
  State<CityChangeView> createState() => _CityChangeViewState();
}

class _CityChangeViewState extends State<CityChangeView>
    with CityChangeViewMixin, NavigatorManagerMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: context.colors.primary,
      body: context.watch<CityListNotifier>().isLoading ||
              context.watch<CurrentCityNotifier>().isLoading
          ? const LoadingLottie()
          : ListView.builder(
              itemCount: context.watch<CityListNotifier>().cities?.length ?? 0,
              itemBuilder: (context, index) {
                return Padding(
                  padding: context.paddingLow,
                  child: InkWell(
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
                      await context
                          .read<CurrentCityNotifier>()
                          .changeCurrentCity(
                              city:
                                  context
                                          .read<CityListNotifier>()
                                          .cities?[index] ??
                                      City(),
                              service: weatherService,
                              unit:
                                  context.read<HeatUnitNotifier>().currentUnit);
                    },
                    child: Card(
                      child: ListTile(
                          leading: Text(context
                                  .read<CityListNotifier>()
                                  .cities?[index]
                                  .name ??
                              "")),
                    ),
                  ),
                );
              }),
    );
  }
}
