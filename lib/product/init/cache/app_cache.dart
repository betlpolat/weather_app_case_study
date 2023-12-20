import 'package:shared_preferences/shared_preferences.dart';

class AppCache {
  AppCache._();

  static AppCache instance = AppCache._();
  late SharedPreferences sharedPreferences;

  Future<void> setUp() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }
}
