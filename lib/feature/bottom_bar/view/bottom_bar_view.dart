import 'package:flutter/material.dart';
import 'package:weather_app_case_study/feature/home/view/home_view.dart';
import 'package:weather_app_case_study/feature/settings/view/settings_view.dart';

import '../../../product/utility/enum/index.dart';
import '../view_model/bottom_bar_view_model.dart';
import 'widget/index.dart';

class BottomBarView extends StatefulWidget {
  const BottomBarView({super.key});

  @override
  State<BottomBarView> createState() => _BottomBarViewState();
}

class _BottomBarViewState extends State<BottomBarView>
    with TickerProviderStateMixin, BottomBarViewModel {
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
        bottomNavigationBar: CustomBottomBar(tabController: _tabController),
        appBar: AppBar(
          title: const CityButton(),
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
