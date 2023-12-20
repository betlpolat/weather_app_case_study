import 'package:flutter/material.dart';

mixin NavigatorManagerMixin {
  Future<T?> navigateToWidget<T>(BuildContext context,
      {required Widget widget, bool fullscreenDialog = false}) {
    return Navigator.of(context).push<T>(
      MaterialPageRoute(
          builder: (context) {
            return widget;
          },
          fullscreenDialog: fullscreenDialog),
    );
  }

  void navigatePopToWidget(BuildContext context) {
    Navigator.of(context).pop();
  }
}
