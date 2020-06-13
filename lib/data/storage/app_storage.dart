import 'package:flutter_clean_architecture/data/storage/storage.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@singleton
@injectable
@RegisterAs(Storage)
class AppStorage implements Storage {
  final SharedPreferences _preferences;

  AppStorage(this._preferences);

  final String _cityNames = 'key_city_names';

  @override
  Future<List<String>> getCityNames() async {
    final cities = _preferences.getString(_cityNames);
    return cities != null && cities.isNotEmpty
        ? cities.split(',')
        : <String>[];
  }

  @override
  Future<void> saveCityName(String cityName) async {
    final cities = await getCityNames();
    cities.add(cityName);
    await _preferences.setString(_cityNames, cities.join(','));
  }
}
