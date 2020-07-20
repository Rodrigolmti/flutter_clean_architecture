// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'dart:async';

import 'package:get_it/get_it.dart';
import 'package:injectable/get_it_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/data_source/local/app_local_data_source.dart';
import '../data/data_source/local/local_data_source.dart';
import '../data/data_source/remote/app_remote_data_source.dart';
import '../data/data_source/remote/remote_data_source.dart';
import '../data/http_manager/app_http_manager.dart';
import '../data/http_manager/http_manager.dart';
import '../data/mapper/remote_mappers.dart';
import '../data/mock/app_mock_remote_service.dart';
import '../data/repository/app_repository.dart';
import '../data/service/app_remote_service.dart';
import '../data/service/remote_service.dart';
import '../data/storage/app_storage.dart';
import '../data/storage/storage.dart';
import '../domain/repository/repository.dart';
import '../domain/use_case/get_saved_cities_use_case.dart';
import '../domain/use_case/get_weather_by_city_name_use_case.dart';
import '../domain/use_case/save_city_name_use_case.dart';
import '../ui/home_controller.dart';
import 'injector_module.dart';

/// adds generated dependencies
/// to the provided [GetIt] instance

Future<void> $initGetIt(GetIt g, {String environment}) async {
  final gh = GetItHelper(g, environment);
  final serviceModule = _$ServiceModule();
  gh.factory<ForecastResponseMapper>(() => ForecastResponseMapper());
  gh.factory<RemoteService>(() => AppMockRemoteService(), instanceName: 'mock');
  gh.factory<RemoteService>(() => AppRemoteService(g<HttpManager>()),
      instanceName: 'default');
  final sharedPreferences = await serviceModule.prefs;
  gh.factory<SharedPreferences>(() => sharedPreferences);
  gh.factory<RemoteDataSource>(() => AppRemoteDataSource(
        g<RemoteService>(instanceName: 'mock'),
        g<RemoteService>(instanceName: 'default'),
        g<ForecastResponseMapper>(),
      ));
  gh.factory<SaveCityNameUseCase>(() => SaveCityName(g<Repository>()));
  gh.factory<GetSavesCitiesUseCase>(() => GetSavesCities(g<Repository>()));
  gh.factory<GetWeatherByCityNameUseCase>(
      () => GetWeatherByCityName(g<Repository>(), g<SaveCityNameUseCase>()));
  gh.factory<HomeController>(() => HomeController(
      g<GetWeatherByCityNameUseCase>(), g<GetSavesCitiesUseCase>()));

  // Eager singletons must be registered in the right order
  gh.singleton<HttpManager>(AppHttpManager());
  gh.singleton<Storage>(AppStorage(g<SharedPreferences>()));
  gh.singleton<LocalDataSource>(AppLocalDataSource(g<Storage>()));
  gh.singleton<Repository>(
      AppRepository(g<RemoteDataSource>(), g<LocalDataSource>()));
}

class _$ServiceModule extends ServiceModule {}
