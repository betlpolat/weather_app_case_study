import 'package:weather_app_case_study/product/utility/enum/heat_unit.dart';

import 'app_cache.dart';

enum CacheKeys {
  heatUnit;

  String get readString =>
      AppCache.instance.sharedPreferences.getString(name) ?? "";
  Future<bool> writeString(HeatUnit value) =>
      AppCache.instance.sharedPreferences.setString(name, value.symbol);
}
