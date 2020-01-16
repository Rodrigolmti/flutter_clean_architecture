import 'package:flutter_clean_architecture/data/http_manager/app_http_manager.dart';
import 'package:flutter_clean_architecture/data/http_manager/http_manager.dart';
import 'package:flutter_clean_architecture/data/local/app_local_data_source.dart';
import 'package:flutter_clean_architecture/data/local/local_data_source.dart';
import 'package:flutter_clean_architecture/data/mock/app_mock_remote_service.dart';
import 'package:flutter_clean_architecture/data/remote/app_remote_data_source.dart';
import 'package:flutter_clean_architecture/data/remote/remote_data_source.dart';
import 'package:flutter_clean_architecture/data/repository/app_repository.dart';
import 'package:flutter_clean_architecture/data/service/app_remote_service.dart';
import 'package:flutter_clean_architecture/data/service/remote_service.dart';
import 'package:flutter_clean_architecture/data/storage/app_storage.dart';
import 'package:flutter_clean_architecture/data/storage/storage.dart';
import 'package:flutter_clean_architecture/domain/repository/repository.dart';
import 'package:flutter_clean_architecture/domain/use_case/get_saved_cities_use_case.dart';
import 'package:flutter_clean_architecture/domain/use_case/get_weather_by_city_name_use_case.dart';
import 'package:flutter_clean_architecture/domain/use_case/save_city_name_use_case.dart';
import 'package:flutter_clean_architecture/ui/home_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

GetIt serviceLocator = GetIt.instance;

Future<void> setupLocator() async {
  final SharedPreferences preferences = await SharedPreferences.getInstance();
  serviceLocator.registerSingleton<SharedPreferences>(preferences);

  serviceLocator.registerSingleton<Repository>(AppRepository());

  serviceLocator.registerLazySingleton<HttpManager>(() => AppHttpManager());
  serviceLocator
      .registerLazySingleton<RemoteDataSource>(() => AppRemoteDataSource());

//  serviceLocator.registerLazySingleton<RemoteService>(() => AppRemoteService());
  serviceLocator.registerLazySingleton<RemoteService>(() => AppMockRemoteService());

  serviceLocator.registerLazySingleton<Storage>(() => AppStorage());
  serviceLocator
      .registerLazySingleton<LocalDataSource>(() => AppLocalDataSource());

  serviceLocator.registerFactory<GetWeatherByCityNameUseCase>(
      () => GetWeatherByCityName(serviceLocator.get(), serviceLocator.get()));
  serviceLocator.registerFactory<SaveCityNameUseCase>(
      () => SaveCityName(serviceLocator.get()));
  serviceLocator.registerFactory<GetSavesCitiesUseCase>(
      () => GetSavesCities(serviceLocator.get()));

  serviceLocator.registerFactory(
      () => HomeBloc(serviceLocator.get(), serviceLocator.get()));
}
