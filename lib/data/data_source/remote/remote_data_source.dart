import 'package:flutter_clean_architecture/domain/model/weather.dart';

mixin RemoteDataSource {
  Future<Weather> getWeatherByCityName(String cityName);
}