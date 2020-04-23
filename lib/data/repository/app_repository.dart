import 'package:flutter_clean_architecture/core/app_result.dart';
import 'package:flutter_clean_architecture/data/local/local_data_source.dart';
import 'package:flutter_clean_architecture/data/remote/remote_data_source.dart';
import 'package:flutter_clean_architecture/domain/repository/repository.dart';
import 'package:injectable/injectable.dart';

@injectable
@RegisterAs(Repository)
class AppRepository implements Repository {
  final RemoteDataSource remoteDataSource;
  final LocalDataSource localDataSource;

  AppRepository(this.remoteDataSource, this.localDataSource);

  @override
  Future<AppResult> getWeatherByCityName(String cityName) =>
      remoteDataSource.getWeatherByCityName(cityName);

  @override
  List<String> getCityNames() => localDataSource.getCityNames();

  @override
  void saveCityName(String cityName) => localDataSource.saveCityName(cityName);
}
