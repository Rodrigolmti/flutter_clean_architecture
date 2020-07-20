import 'package:flutter_clean_architecture/domain/model/weather.dart';
import 'package:flutter_clean_architecture/domain/repository/repository.dart';
import 'package:flutter_clean_architecture/domain/use_case/save_city_name_use_case.dart';
import 'package:injectable/injectable.dart';

mixin GetWeatherByCityNameUseCase {
  Future<Weather> call(String cityName);
}

@Injectable(as: GetWeatherByCityNameUseCase)
class GetWeatherByCityName implements GetWeatherByCityNameUseCase {
  final Repository repository;
  final SaveCityNameUseCase saveCityNameUseCase;

  GetWeatherByCityName(this.repository, this.saveCityNameUseCase);

  @override
  Future<Weather> call(String cityName) async {
    final response = await repository.getWeatherByCityName(cityName);
    await saveCityNameUseCase(cityName);
    return response;
  }
}
