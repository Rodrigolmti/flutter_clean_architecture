import 'package:flutter_clean_architecture/core/app_result.dart';
import 'package:flutter_clean_architecture/data/mapper/remote_mappers.dart';
import 'package:flutter_clean_architecture/data/remote/remote_data_source.dart';
import 'package:flutter_clean_architecture/data/response/weather_response.dart';
import 'package:flutter_clean_architecture/data/service/remote_service.dart';
import 'package:flutter_clean_architecture/domain/exceptions/app_exceptions.dart';
import 'package:injectable/injectable.dart';

@injectable
@RegisterAs(RemoteDataSource)
class AppRemoteDataSource implements RemoteDataSource {
  final RemoteService _mockRemote;
  final RemoteService _remote;

  AppRemoteDataSource(
    @Named('mock') this._mockRemote,
    @Named('default') this._remote,
  );

  @override
  Future<AppResult> getWeatherByCityName(String cityName) async {
    try {
      final response = ForecastResponse.fromJson(
          await _mockRemote.getWeatherByCityName(cityName));
      return AppResult.success(mapForecastResponseToWeather(response));
    } on AppException catch (error) {
      return AppResult.failure(error.message);
    } catch (e) {
      return AppResult.failure();
    }
  }
}
