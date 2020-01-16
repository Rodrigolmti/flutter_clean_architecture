import 'package:flutter_clean_architecture/core/app_result.dart';
import 'package:flutter_clean_architecture/data/local/local_data_source.dart';
import 'package:flutter_clean_architecture/data/remote/remote_data_source.dart';
import 'package:flutter_clean_architecture/di/service_locator.dart';
import 'package:flutter_clean_architecture/domain/repository/repository.dart';

class AppRepository implements Repository {
  static final remoteDataSource = serviceLocator<RemoteDataSource>();
  static final localDataSource = serviceLocator<LocalDataSource>();

  @override
  Future<AppResult> getWeatherByCityName(String cityName) =>
      remoteDataSource.getWeatherByCityName(cityName);

  @override
  List<String> getCityNames() => localDataSource.getCityNames();

  @override
  void saveCityName(String cityName) => localDataSource.saveCityName(cityName);
}
