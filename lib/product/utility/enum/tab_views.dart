import 'package:flutter/material.dart';

enum TabViews {
  home(icon: (Icons.home)),
  settings(icon: Icons.settings);

  final IconData icon;

  const TabViews({required this.icon});
}
