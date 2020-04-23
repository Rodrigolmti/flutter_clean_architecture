import 'package:flutter_clean_architecture/data/storage/storage.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@injectable
@RegisterAs(Storage)
class AppStorage implements Storage {
  final SharedPreferences _preferences;

  AppStorage(this._preferences);

  final String _cityNames = "key_city_names";

  @override
  List<String> getCityNames() {
    final String cities = _preferences.getString(_cityNames);
    return cities != null && cities.isNotEmpty
        ? cities.split(',')
        : List<String>();
  }

  @override
  void saveCityName(String cityName) {
    final List<String> cities = getCityNames();
    cities.add(cityName);
    _preferences.setString(_cityNames, cities.join(','));
  }
}
