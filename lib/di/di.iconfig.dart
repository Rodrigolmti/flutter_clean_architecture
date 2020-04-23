// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:flutter_clean_architecture/data/http_manager/app_http_manager.dart';
import 'package:flutter_clean_architecture/data/http_manager/http_manager.dart';
import 'package:flutter_clean_architecture/data/mock/app_mock_remote_service.dart';
import 'package:flutter_clean_architecture/data/service/remote_service.dart';
import 'package:flutter_clean_architecture/data/service/app_remote_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_clean_architecture/di/di_module.dart';
import 'package:flutter_clean_architecture/data/storage/app_storage.dart';
import 'package:flutter_clean_architecture/data/storage/storage.dart';
import 'package:flutter_clean_architecture/data/local/app_local_data_source.dart';
import 'package:flutter_clean_architecture/data/local/local_data_source.dart';
import 'package:flutter_clean_architecture/data/remote/app_remote_data_source.dart';
import 'package:flutter_clean_architecture/data/remote/remote_data_source.dart';
import 'package:flutter_clean_architecture/data/repository/app_repository.dart';
import 'package:flutter_clean_architecture/domain/repository/repository.dart';
import 'package:flutter_clean_architecture/domain/use_case/save_city_name_use_case.dart';
import 'package:flutter_clean_architecture/domain/use_case/get_saved_cities_use_case.dart';
import 'package:flutter_clean_architecture/domain/use_case/get_weather_by_city_name_use_case.dart';
import 'package:flutter_clean_architecture/ui/home_bloc.dart';
import 'package:get_it/get_it.dart';

Future<void> $initGetIt(GetIt g, {String environment}) async {
  final serviceModule = _$ServiceModule();
  g.registerFactory<HttpManager>(() => AppHttpManager());
  g.registerFactory<RemoteService>(() => AppMockRemoteService(),
      instanceName: 'mock');
  g.registerFactory<RemoteService>(() => AppRemoteService(g<HttpManager>()),
      instanceName: 'default');
  final sharedPreferences = await serviceModule.dio;
  g.registerFactory<SharedPreferences>(() => sharedPreferences);
  g.registerFactory<Storage>(() => AppStorage(g<SharedPreferences>()));
  g.registerFactory<LocalDataSource>(() => AppLocalDataSource(g<Storage>()));
  g.registerFactory<RemoteDataSource>(() => AppRemoteDataSource(
      g<RemoteService>('mock'),
      g<RemoteService>('default')));
  g.registerFactory<Repository>(
      () => AppRepository(g<RemoteDataSource>(), g<LocalDataSource>()));
  g.registerFactory<SaveCityNameUseCase>(() => SaveCityName(g<Repository>()));
  g.registerFactory<GetSavesCitiesUseCase>(
      () => GetSavesCities(g<Repository>()));
  g.registerFactory<GetWeatherByCityNameUseCase>(
      () => GetWeatherByCityName(g<Repository>(), g<SaveCityNameUseCase>()));
  g.registerFactory<HomeBloc>(() =>
      HomeBloc(g<GetWeatherByCityNameUseCase>(), g<GetSavesCitiesUseCase>()));
}

class _$ServiceModule extends ServiceModule {}
