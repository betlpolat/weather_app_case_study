import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app_case_study/core/extension/index.dart';
import 'package:weather_app_case_study/feature/city_change/view/widget/city_items.dart';
import 'package:weather_app_case_study/feature/city_change/view_model/city_change_view_model.dart';
import 'package:weather_app_case_study/product/widget/loading_lottie.dart';

import '../../../core/base/mixin/navigator_manager_mixin.dart';
import '../../../product/state/index.dart';

class CityChangeView extends StatefulWidget {
  const CityChangeView({super.key});

  @override
  State<CityChangeView> createState() => _CityChangeViewState();
}

class _CityChangeViewState extends State<CityChangeView>
    with CityChangeViewModel, NavigatorManagerMixin {
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
                  child: CityItems(
                    index: index,
                  ),
                );
              }),
    );
  }
}
