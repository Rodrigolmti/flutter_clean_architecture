import 'package:flutter_clean_architecture/core/app_result.dart';

abstract class RemoteDataSource {
  Future<AppResult> getWeatherByCityName(String cityName);
}