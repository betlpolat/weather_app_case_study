import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app_case_study/core/extension/index.dart';
import 'package:weather_app_case_study/feature/settings/view_model/settings_view_model.dart';

import '../../../../product/init/language/locale_keys.g.dart';
import '../../../../product/state/heat_unit_notifier.dart';

class UnitOptionButton extends StatefulWidget {
  const UnitOptionButton({
    super.key,
  });

  @override
  State<UnitOptionButton> createState() => _UnitOptionButtonState();
}

class _UnitOptionButtonState extends State<UnitOptionButton>
    with SettingsViewModel {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        await changeUnit();
      },
      child: Card(
          child: ListTile(
        leading: Text(
          LocaleKeys.settings_unit_option.locale,
          style: context.textTheme.titleSmall,
        ),
        trailing: Text(
          context.watch<HeatUnitNotifier>().currentUnit,
          style: context.textTheme.titleLarge,
        ),
      )),
    );
  }
}
