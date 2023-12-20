import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:weather_app_case_study/feature/bottom_bar/view/bottom_bar_view.dart';

mixin BottomBarViewModel on State<BottomBarView> {
  @override
  void initState() {
    super.initState();
    checkPermission(Permission.location);
  }

  Future<void> checkPermission(Permission permission) async {
    final status = await permission.request();
    if (status.isGranted) {
      if (!mounted) return;
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Permission is Granted")));
    } else {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Permission is not Granted")));
    }
  }
}
