import 'package:flutter_clean_architecture/data/data_source/local/local_data_source.dart';
import 'package:flutter_clean_architecture/data/data_source/remote/remote_data_source.dart';
import 'package:flutter_clean_architecture/domain/model/weather.dart';
import 'package:flutter_clean_architecture/domain/repository/repository.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: Repository)
class AppRepository implements Repository {
  final RemoteDataSource remoteDataSource;
  final LocalDataSource localDataSource;

  AppRepository(this.remoteDataSource, this.localDataSource);

  @override
  Future<Weather> getWeatherByCityName(String cityName) async =>
      remoteDataSource.getWeatherByCityName(cityName);

  @override
  Future<List<String>> getCityNames() async => localDataSource.getCityNames();

  @override
  Future<void> saveCityName(String cityName) async =>
      localDataSource.saveCityName(cityName);
}
