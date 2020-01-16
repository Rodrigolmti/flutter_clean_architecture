import 'package:flutter_clean_architecture/data/local/local_data_source.dart';
import 'package:flutter_clean_architecture/data/storage/storage.dart';
import 'package:flutter_clean_architecture/di/service_locator.dart';

class AppLocalDataSource implements LocalDataSource {
  static final storage = serviceLocator<Storage>();

  @override
  List<String> getCityNames() => storage.getCityNames();

  @override
  void saveCityName(String cityName) => storage.saveCityName(cityName);
}
