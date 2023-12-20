import 'package:dio/dio.dart';

class NetworkManager {
  NetworkManager._() {
    _dio = Dio(BaseOptions(
      headers: {
        "Content-Type": "application/json",
      },
    ));
  }

  late final Dio _dio;

  static NetworkManager instance = NetworkManager._();
  Dio get service => _dio;
}
