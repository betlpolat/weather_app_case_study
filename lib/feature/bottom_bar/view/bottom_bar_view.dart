import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app_case_study/core/base/mixin/navigator_manager_mixin.dart';
import 'package:weather_app_case_study/core/extension/context_extension.dart';
import 'package:weather_app_case_study/feature/city_change/view/city_change_view.dart';
import 'package:weather_app_case_study/feature/home/view/home_view.dart';
import 'package:weather_app_case_study/feature/settings/view/settings_view.dart';

import '../../../product/state/current_city_notifier.dart';

class BottomBarView extends StatefulWidget {
  const BottomBarView({super.key});

  @override
  State<BottomBarView> createState() => _BottomBarViewState();
}

class _BottomBarViewState extends State<BottomBarView>
    with TickerProviderStateMixin, NavigatorManagerMixin {
  late final TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: TabViews.values.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: TabViews.values.length,
      child: Scaffold(
        bottomNavigationBar: BottomAppBar(
            child: TabBar(
                controller: _tabController,
                tabs: TabViews.values
                    .map((e) => Tab(
                          icon: Icon(e.icon),
                        ))
                    .toList())),
        appBar: AppBar(
          title: InkWell(
            onTap: () {
              navigateToWidget(context,
                  widget: const CityChangeView(), fullscreenDialog: true);
            },
            child: Text(
              context.watch<CurrentCityNotifier>().currentCity?.name ??
                  "Şehir Seçin",
              style: context.textTheme.headlineMedium,
            ),
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          physics: const NeverScrollableScrollPhysics(),
          children: const [HomeView(), SettingsView()],
        ),
      ),
    );
  }
}

enum TabViews {
  home(icon: (Icons.home)),
  settings(icon: Icons.settings);

  final IconData icon;

  const TabViews({required this.icon});
}
