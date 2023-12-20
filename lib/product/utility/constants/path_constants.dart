import 'package:flutter/material.dart';

@immutable
class PathConstants {
  const PathConstants._();

  static String cityUrl = "https://turkiyeapi.dev/api/v1/provinces";
  static String weatherUrl =
      "current=temperature_2m,weather_code&hourly=temperature_2m&daily=temperature_2m_max";
  static String baseUrl = "https://api.open-meteo.com/v1/forecast";
}
