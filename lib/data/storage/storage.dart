abstract class Storage {
  Future<void> saveCityName(String cityName);

  Future<List<String>> getCityNames();
}