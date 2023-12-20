import 'package:flutter/material.dart';

/// Project locale enum for operation and configuration
enum Locales {
  /// Turkish locale
  tr(Locale('tr', 'TR'));

  /// Locale value
  final Locale locale;

  const Locales(this.locale);
}
