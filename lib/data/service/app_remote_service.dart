import 'package:flutter_clean_architecture/core/constants.dart';
import 'package:flutter_clean_architecture/data/http_manager/http_manager.dart';
import 'package:flutter_clean_architecture/data/service/remote_service.dart';
import 'package:injectable/injectable.dart';

@Named('default')
@Injectable(as: RemoteService)
class AppRemoteService implements RemoteService {
  final HttpManager httpManager;

  AppRemoteService(this.httpManager);

  @override
  Future getWeatherByCityName(String cityName) async => httpManager.get(
        url: '/data/2.5/weather',
        query: {'q': cityName, 'apiKey': apiKey},
      );
}