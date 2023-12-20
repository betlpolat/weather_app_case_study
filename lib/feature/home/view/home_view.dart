import 'package:flutter/material.dart';
import 'package:weather_app_case_study/core/extension/index.dart';
import 'package:weather_app_case_study/feature/home/view_model/home_view_model.dart';
import 'package:weather_app_case_study/product/widget/loading_lottie.dart';

import '../../../product/base/model/index.dart';
import 'widget/index.dart';

class HomeView extends StatefulWidget {
  const HomeView({
    super.key,
  });

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView>
    with HomeViewModel, AutomaticKeepAliveClientMixin {
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
                  const Expanded(
                    flex: 1,
                    child: CurrentForecast(),
                  ),
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: context.paddingLow,
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          DailyForecast(),
                          Spacer(),
                          HourlyForecast(),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            } else {
              return const SizedBox.shrink();
            }
        }
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
