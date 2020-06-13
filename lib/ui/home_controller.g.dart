// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeController, Store {
  Computed<bool> _$weatherHasErrorComputed;

  @override
  bool get weatherHasError =>
      (_$weatherHasErrorComputed ??= Computed<bool>(() => super.weatherHasError,
              name: '_HomeController.weatherHasError'))
          .value;
  Computed<FutureStatus> _$weatherObserverStatusComputed;

  @override
  FutureStatus get weatherObserverStatus => (_$weatherObserverStatusComputed ??=
          Computed<FutureStatus>(() => super.weatherObserverStatus,
              name: '_HomeController.weatherObserverStatus'))
      .value;
  Computed<bool> _$isFetchCitiesAgainComputed;

  @override
  bool get isFetchCitiesAgain => (_$isFetchCitiesAgainComputed ??=
          Computed<bool>(() => super.isFetchCitiesAgain,
              name: '_HomeController.isFetchCitiesAgain'))
      .value;
  Computed<bool> _$weatherIsLoadingComputed;

  @override
  bool get weatherIsLoading => (_$weatherIsLoadingComputed ??= Computed<bool>(
          () => super.weatherIsLoading,
          name: '_HomeController.weatherIsLoading'))
      .value;
  Computed<bool> _$citiesHasErrorComputed;

  @override
  bool get citiesHasError =>
      (_$citiesHasErrorComputed ??= Computed<bool>(() => super.citiesHasError,
              name: '_HomeController.citiesHasError'))
          .value;

  final _$citiesObservableAtom = Atom(name: '_HomeController.citiesObservable');

  @override
  ObservableFuture<List<String>> get citiesObservable {
    _$citiesObservableAtom.reportRead();
    return super.citiesObservable;
  }

  @override
  set citiesObservable(ObservableFuture<List<String>> value) {
    _$citiesObservableAtom.reportWrite(value, super.citiesObservable, () {
      super.citiesObservable = value;
    });
  }

  final _$weatherObservableAtom =
      Atom(name: '_HomeController.weatherObservable');

  @override
  ObservableFuture<Weather> get weatherObservable {
    _$weatherObservableAtom.reportRead();
    return super.weatherObservable;
  }

  @override
  set weatherObservable(ObservableFuture<Weather> value) {
    _$weatherObservableAtom.reportWrite(value, super.weatherObservable, () {
      super.weatherObservable = value;
    });
  }

  final _$getListOfSavedCitiesAsyncAction =
      AsyncAction('_HomeController.getListOfSavedCities');

  @override
  Future<void> getListOfSavedCities() {
    return _$getListOfSavedCitiesAsyncAction
        .run(() => super.getListOfSavedCities());
  }

  final _$onGetWeatherByCityNameAsyncAction =
      AsyncAction('_HomeController.onGetWeatherByCityName');

  @override
  Future<void> onGetWeatherByCityName(String cityName) {
    return _$onGetWeatherByCityNameAsyncAction
        .run(() => super.onGetWeatherByCityName(cityName));
  }

  @override
  String toString() {
    return '''
citiesObservable: ${citiesObservable},
weatherObservable: ${weatherObservable},
weatherHasError: ${weatherHasError},
weatherObserverStatus: ${weatherObserverStatus},
isFetchCitiesAgain: ${isFetchCitiesAgain},
weatherIsLoading: ${weatherIsLoading},
citiesHasError: ${citiesHasError}
    ''';
  }
}
