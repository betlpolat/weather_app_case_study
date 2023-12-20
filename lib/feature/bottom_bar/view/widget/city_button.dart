import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app_case_study/core/extension/index.dart';

import '../../../../core/base/mixin/navigator_manager_mixin.dart';
import '../../../../product/init/language/locale_keys.g.dart';
import '../../../../product/state/current_city_notifier.dart';
import '../../../city_change/view/city_change_view.dart';

class CityButton extends StatefulWidget {
  const CityButton({super.key});

  @override
  State<CityButton> createState() => _CityButtonState();
}

class _CityButtonState extends State<CityButton> with NavigatorManagerMixin {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        navigateToWidget(context,
            widget: const CityChangeView(), fullscreenDialog: true);
      },
      child: Text(
        context.watch<CurrentCityNotifier>().currentCity?.name ??
            LocaleKeys.general_title.locale,
        style: context.textTheme.headlineMedium,
      ),
    );
  }
}
