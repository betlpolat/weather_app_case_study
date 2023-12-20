import 'package:flutter/material.dart';
import 'package:weather_app_case_study/core/extension/context_extension.dart';
import 'package:weather_app_case_study/feature/settings/view/widget/unit_option_button.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: context.paddingLow,
          child: const UnitOptionButton(),
        )
      ],
    );
  }
}
