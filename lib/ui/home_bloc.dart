import 'package:flutter_clean_architecture/core/app_result.dart';
import 'package:flutter_clean_architecture/core/app_state.dart';
import 'package:flutter_clean_architecture/core/bloc.dart';
import 'package:flutter_clean_architecture/domain/use_case/get_saved_cities_use_case.dart';
import 'package:flutter_clean_architecture/domain/use_case/get_weather_by_city_name_use_case.dart';

abstract class HomeState extends AppState {}

class OnGetSavedCities extends HomeState {
  List<String> cities;

  OnGetSavedCities(this.cities);
}

class HomeBloc extends Bloc {
  final GetWeatherByCityNameUseCase _getWeatherUseCase;
  final GetSavesCitiesUseCase _getSavesCitiesUseCase;

  HomeBloc(this._getWeatherUseCase, this._getSavesCitiesUseCase);

  void getListOfSavedCities() {
    streamController.sink
        .add(OnGetSavedCities(_getSavesCitiesUseCase.execute()));
  }

  void onGetWeatherByCityName(String cityName) async {
    streamController.add(Loading());
    final response = await _getWeatherUseCase.execute(cityName);
    switch (response.status) {
      case Status.SUCCESS:
        getListOfSavedCities();
        streamController.sink.add(Success(response.data));
        break;
      case Status.FAILURE:
        streamController.sink.add(Failure(response.message));
        break;
    }
  }
}
