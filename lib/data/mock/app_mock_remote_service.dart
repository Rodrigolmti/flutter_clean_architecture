import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_clean_architecture/data/service/remote_service.dart';
import 'package:injectable/injectable.dart';

@injectable
@Named('mock')
@RegisterAs(RemoteService)
class AppMockRemoteService implements RemoteService {

  @override
  Future getWeatherByCityName(String cityName) =>
      _parseFileToJson('assets/json/weather_forecast.json');

  dynamic _parseFileToJson(String path) async {
    final string = await rootBundle.loadString(path);
    return json.decode(string);
  }
}
