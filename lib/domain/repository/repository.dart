import 'package:flutter_clean_architecture/domain/model/weather.dart';

abstract class Repository {

  Future<Weather> getWeatherByCityName(String cityName);

  Future<void> saveCityName(String cityName);

  Future<List<String>> getCityNames();
}