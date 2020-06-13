import 'package:flutter_clean_architecture/domain/model/weather.dart';
import 'package:flutter_clean_architecture/domain/use_case/get_saved_cities_use_case.dart';
import 'package:flutter_clean_architecture/domain/use_case/get_weather_by_city_name_use_case.dart';
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

@injectable
class HomeController = _HomeController with _$HomeController;

abstract class _HomeController with Store {
  final GetWeatherByCityNameUseCase _getWeatherUseCase;
  final GetSavesCitiesUseCase _getSavesCitiesUseCase;

  _HomeController(
    this._getWeatherUseCase,
    this._getSavesCitiesUseCase,
  );

  @observable
  ObservableFuture<List<String>> citiesObservable;

  @observable
  ObservableFuture<Weather> weatherObservable;

  @computed
  bool get weatherHasError => weatherObservable?.error != null ?? false;

  @computed
  FutureStatus get weatherObserverStatus => weatherObservable?.status;

  @computed
  bool get isFetchCitiesAgain =>
      weatherObserverStatus != null &&
      weatherObserverStatus == FutureStatus.fulfilled;

  @computed
  bool get weatherIsLoading =>
      weatherObserverStatus == FutureStatus.pending && !weatherHasError;

  @computed
  bool get citiesHasError => citiesObservable?.error ?? false;

  @action
  Future<void> getListOfSavedCities() async {
    citiesObservable = _getSavesCitiesUseCase().asObservable();
  }

  @action
  Future<void> onGetWeatherByCityName(String cityName) async {
    weatherObservable = _getWeatherUseCase(cityName).asObservable();
  }
}
