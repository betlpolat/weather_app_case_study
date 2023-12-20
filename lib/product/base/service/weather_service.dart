import 'dart:io';

import 'package:dio/dio.dart';
import 'package:weather_app_case_study/core/base/network/network_manager.dart';
import 'package:weather_app_case_study/product/base/model/weather.dart';
import 'package:weather_app_case_study/product/utility/constants/path_constants.dart';
import 'package:weather_app_case_study/product/utility/enum/heat_unit.dart';

abstract class IWeatherService {
  final Dio dio;
  num latitude;
  num longitude;
  Future<Weather?> fetchWeather(String unit);

  IWeatherService(
      {required this.dio, this.latitude = 39.92077, this.longitude = 32.85411});
}

class WeatherService extends IWeatherService {
  WeatherService(Dio dio, num latitude, num longitude)
      : super(
            dio: NetworkManager.instance.service,
            latitude: latitude,
            longitude: longitude);

  @override
  Future<Weather?> fetchWeather(String unit) async {
    final Response response;
    if (unit == HeatUnit.fahrenheit.symbol) {
      response = await dio.get(
          "${PathConstants.baseUrl}?latitude=$latitude&longitude=$longitude&&temperature_unit=fahrenheit&&${PathConstants.weatherUrl}");
    } else {
      response = await dio.get(
          "${PathConstants.baseUrl}?latitude=$latitude&longitude=$longitude&&${PathConstants.weatherUrl}");
    }

    if (response.statusCode == HttpStatus.ok) {
      final jsonBody = response.data;
      if (jsonBody is Map<String, dynamic>) {
        print(Weather.fromJson(jsonBody));
        return Weather.fromJson(jsonBody);
      }
    }
    return null;
  }
}
