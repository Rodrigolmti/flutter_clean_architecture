import 'package:flutter_clean_architecture/domain/exceptions/app_exceptions.dart';
import 'package:flutter_clean_architecture/domain/model/weather.dart';
import 'package:flutter_clean_architecture/domain/use_case/get_weather_by_city_name_use_case.dart';
import 'package:flutter_clean_architecture/domain/use_case/save_city_name_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../util/test_stubs.dart';

void main() {
  final repository = MockAppRepository();
  final saveCityNameUseCase = SaveCityName(repository);
  final useCase = GetWeatherByCityName(repository, saveCityNameUseCase);

  const cityName = 'London';

  test('execute should return weather forecast', () async {
    const weather = Weather();
    when(repository.getWeatherByCityName(any)).thenAnswer((_) async => weather);

    final response = await useCase(cityName);

    expect(weather, response);
  });

  test('execute should call repository method', () async {
    const weather = Weather();
    when(repository.getWeatherByCityName(any)).thenAnswer((_) async => weather);

    await useCase(cityName);

    verify(repository.getWeatherByCityName(cityName));
  });

  test('execute should save city name', () async {
    const weather = Weather();
    when(repository.getWeatherByCityName(any)).thenAnswer((_) async => weather);

    await useCase(cityName);

    verify(saveCityNameUseCase(cityName));
  });

  test('execute should thrown server failure', () async {
    when(repository.getWeatherByCityName(any))
        .thenThrow(ServerException());

    expect(() => useCase(cityName), throwsException);
  });
}
