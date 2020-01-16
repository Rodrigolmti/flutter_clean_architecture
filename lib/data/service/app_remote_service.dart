import 'package:flutter_clean_architecture/core/contants.dart';
import 'package:flutter_clean_architecture/data/http_manager/http_manager.dart';
import 'package:flutter_clean_architecture/data/service/remote_service.dart';
import 'package:flutter_clean_architecture/di/service_locator.dart';

class AppRemoteService implements RemoteService {
  static final httpManager = serviceLocator<HttpManager>();

  @override
  Future getWeatherByCityName(String cityName) async => await httpManager.get(
      url: '/data/2.5/weather',
      query: {'q': cityName, 'apiKey': Constants.api_key});
}
