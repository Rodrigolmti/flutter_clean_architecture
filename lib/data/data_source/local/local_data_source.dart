abstract class LocalDataSource {
  void saveCityName(String cityName);

  Future<List<String>> getCityNames();
}