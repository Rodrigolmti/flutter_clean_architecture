// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:flutter_clean_architecture/data/mapper/remote_mappers.dart';
import 'package:flutter_clean_architecture/data/http_manager/app_http_manager.dart';
import 'package:flutter_clean_architecture/data/http_manager/http_manager.dart';
import 'package:flutter_clean_architecture/data/mock/app_mock_remote_service.dart';
import 'package:flutter_clean_architecture/data/service/remote_service.dart';
import 'package:flutter_clean_architecture/data/service/app_remote_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_clean_architecture/di/injector_module.dart';
import 'package:flutter_clean_architecture/data/storage/app_storage.dart';
import 'package:flutter_clean_architecture/data/storage/storage.dart';
import 'package:flutter_clean_architecture/data/data_source/local/app_local_data_source.dart';
import 'package:flutter_clean_architecture/data/data_source/local/local_data_source.dart';
import 'package:flutter_clean_architecture/data/data_source/remote/app_remote_data_source.dart';
import 'package:flutter_clean_architecture/data/data_source/remote/remote_data_source.dart';
import 'package:flutter_clean_architecture/data/repository/app_repository.dart';
import 'package:flutter_clean_architecture/domain/repository/repository.dart';
import 'package:flutter_clean_architecture/domain/use_case/save_city_name_use_case.dart';
import 'package:flutter_clean_architecture/domain/use_case/get_saved_cities_use_case.dart';
import 'package:flutter_clean_architecture/domain/use_case/get_weather_by_city_name_use_case.dart';
import 'package:flutter_clean_architecture/ui/home_controller.dart';
import 'package:get_it/get_it.dart';

Future<void> $initGetIt(GetIt g, {String environment}) async {
  final serviceModule = _$ServiceModule();
  g.registerFactory<ForecastResponseMapper>(() => ForecastResponseMapper());
  g.registerFactory<RemoteService>(() => AppMockRemoteService(),
      instanceName: 'mock');
  g.registerFactory<RemoteService>(() => AppRemoteService(g<HttpManager>()),
      instanceName: 'default');
  final sharedPreferences = await serviceModule.prefs;
  g.registerFactory<SharedPreferences>(() => sharedPreferences);
  g.registerFactory<RemoteDataSource>(() => AppRemoteDataSource(
        g<RemoteService>(instanceName: 'mock'),
        g<RemoteService>(instanceName: 'default'),
        g<ForecastResponseMapper>(),
      ));
  g.registerFactory<SaveCityNameUseCase>(() => SaveCityName(g<Repository>()));
  g.registerFactory<GetSavesCitiesUseCase>(
      () => GetSavesCities(g<Repository>()));
  g.registerFactory<GetWeatherByCityNameUseCase>(
      () => GetWeatherByCityName(g<Repository>(), g<SaveCityNameUseCase>()));
  g.registerFactory<HomeController>(() => HomeController(
      g<GetWeatherByCityNameUseCase>(), g<GetSavesCitiesUseCase>()));

  //Eager singletons must be registered in the right order
  g.registerSingleton<HttpManager>(AppHttpManager());
  g.registerSingleton<Storage>(AppStorage(g<SharedPreferences>()));
  g.registerSingleton<LocalDataSource>(AppLocalDataSource(g<Storage>()));
  g.registerSingleton<Repository>(
      AppRepository(g<RemoteDataSource>(), g<LocalDataSource>()));
}

class _$ServiceModule extends ServiceModule {}
