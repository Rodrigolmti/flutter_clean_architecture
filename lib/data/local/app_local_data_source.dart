import 'package:flutter_clean_architecture/data/local/local_data_source.dart';
import 'package:flutter_clean_architecture/data/storage/storage.dart';
import 'package:injectable/injectable.dart';

@injectable
@RegisterAs(LocalDataSource)
class AppLocalDataSource implements LocalDataSource {
  final Storage storage;

  AppLocalDataSource(this.storage);

  @override
  List<String> getCityNames() => storage.getCityNames();

  @override
  void saveCityName(String cityName) => storage.saveCityName(cityName);
}
