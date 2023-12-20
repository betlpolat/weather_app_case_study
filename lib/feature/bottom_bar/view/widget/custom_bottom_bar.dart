import 'package:flutter/material.dart';

import '../../../../product/utility/enum/tab_views.dart';

class CustomBottomBar extends StatelessWidget {
  const CustomBottomBar({
    super.key,
    required TabController tabController,
  }) : _tabController = tabController;

  final TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
        child: TabBar(
            controller: _tabController,
            tabs: TabViews.values
                .map((e) => Tab(
                      icon: Icon(e.icon),
                    ))
                .toList()));
  }
}
