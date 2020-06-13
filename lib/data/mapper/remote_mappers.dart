import 'package:flutter_clean_architecture/core/mapper.dart';
import 'package:flutter_clean_architecture/data/response/weather_response.dart';
import 'package:flutter_clean_architecture/domain/model/weather.dart';
import 'package:injectable/injectable.dart';

@injectable
class ForecastResponseMapper implements Mapper<ForecastResponse, Weather> {
  @override
  Weather mapTo(ForecastResponse from) => Weather(
        description: from.weather.first.description,
        feelsLike: from.main.feelsLike,
        main: from.weather.first.main,
        temp: from.main.temp,
      );
}
