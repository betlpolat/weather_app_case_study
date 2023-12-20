import 'dart:io';

import 'package:dio/dio.dart';

import '../model/cities.dart';

abstract class ICityService {
  final Dio dio;
  Future<List<City>?> fetchCity();

  ICityService(this.dio);
}

class CityService extends ICityService {
  CityService(super.dio);

  @override
  Future<List<City>?> fetchCity() async {
    final Response response =
        await dio.get("https://turkiyeapi.dev/api/v1/provinces");
    if (response.statusCode == HttpStatus.ok) {
      final jsonBody = response.data;
      if (jsonBody is Map<String, dynamic>) {
        print(Cities.fromJson(jsonBody).data);
        return Cities.fromJson(jsonBody).data;
      }
    }
    return null;
  }
}
