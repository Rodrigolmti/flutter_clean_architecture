import 'package:flutter_clean_architecture/core/app_result.dart';

abstract class Repository {

  Future<AppResult> getWeatherByCityName(String cityName);

  void saveCityName(String cityName);

  List<String> getCityNames();
}