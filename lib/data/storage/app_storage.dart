import 'package:flutter_clean_architecture/data/storage/storage.dart';
import 'package:flutter_clean_architecture/di/service_locator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppStorage implements Storage {
  static final SharedPreferences _preferences =
      serviceLocator<SharedPreferences>();

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
