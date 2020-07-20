import 'package:flutter_clean_architecture/data/data_source/remote/remote_data_source.dart';
import 'package:flutter_clean_architecture/data/mapper/remote_mappers.dart';
import 'package:flutter_clean_architecture/data/response/weather_response.dart';
import 'package:flutter_clean_architecture/data/service/remote_service.dart';
import 'package:flutter_clean_architecture/domain/exceptions/app_exceptions.dart';
import 'package:flutter_clean_architecture/domain/model/weather.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: RemoteDataSource)
class AppRemoteDataSource implements RemoteDataSource {
  final ForecastResponseMapper _forecastMapper;
  final RemoteService _mockRemote;
  final RemoteService _remote;

  AppRemoteDataSource(
    @Named('mock') this._mockRemote,
    @Named('default') this._remote,
    this._forecastMapper,
  );

  @override
  Future<Weather> getWeatherByCityName(String cityName) async {
    try {
      final response = ForecastResponse.fromJson(
          await _mockRemote.getWeatherByCityName(cityName));
      return _forecastMapper.mapTo(response);
    } on Exception catch (_) {
      throw GenericException();
    }
  }
}
