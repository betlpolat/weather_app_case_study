import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app_case_study/core/extension/context_extension.dart';
import 'package:weather_app_case_study/feature/home/view/mixin/home_mixin.dart';
import 'package:weather_app_case_study/product/state/current_city_notifier.dart';
import 'package:weather_app_case_study/product/widget/loading_lottie.dart';

import '../../../product/base/model/weather.dart';

class HomeView extends StatefulWidget {
  const HomeView({
    super.key,
  });

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView>
    with HomeMixin, AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return FutureBuilder<Weather?>(
      future: weather,
      builder: (BuildContext context, AsyncSnapshot<Weather?> snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
            return const Placeholder();
          case ConnectionState.waiting:
          case ConnectionState.active:
            return const Center(child: LoadingLottie());
          case ConnectionState.done:
            if (snapshot.hasData) {
              return Column(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
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
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: context.paddingLow,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "DAILY FORECAST",
                            style: context.textTheme.titleMedium,
                          ),
                          SizedBox(
                            width: context.width,
                            height: context.highValue,
                            child: ListView.builder(
                                itemCount: 7,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return Card(
                                    margin: context.paddingLow,
                                    child: Container(
                                      margin: context.paddingLowHorizontal,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text((context
                                                      .watch<
                                                          CurrentCityNotifier>()
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
                                }),
                          ),
                          const Spacer(),
                          Text(
                            "HOURLY FORECAST",
                            style: context.textTheme.titleMedium,
                          ),
                          SizedBox(
                            width: context.width,
                            height: context.highValue,
                            child: ListView.builder(
                                itemCount: 12,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return Card(
                                    margin: context.paddingLow,
                                    child: Container(
                                      margin: context.paddingLowHorizontal,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text((context
                                                      .watch<
                                                          CurrentCityNotifier>()
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
                                }),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            } else {
              return const Placeholder();
            }
        }
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
