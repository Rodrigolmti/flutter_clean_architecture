import 'package:flutter_clean_architecture/data/data_source/local/local_data_source.dart';
import 'package:flutter_clean_architecture/data/storage/storage.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: LocalDataSource)
class AppLocalDataSource implements LocalDataSource {
  final Storage storage;

  AppLocalDataSource(this.storage);

  @override
  Future<List<String>> getCityNames() async => storage.getCityNames();

  @override
  void saveCityName(String cityName) => storage.saveCityName(cityName);
}
