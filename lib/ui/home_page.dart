import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/core/widget_state.dart';
import 'package:flutter_clean_architecture/ui/home_controller.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends WidgetSate<HomePage, HomeController> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  ReactionDisposer _reactionErrorDisposer;
  ReactionDisposer _reactionListDisposer;

  @override
  void initState() {
    controller.getListOfSavedCities();
    _listenForUpdateCities();
    _listenForWeatherError();
    super.initState();
  }

  @override
  void dispose() {
    _reactionErrorDisposer.reaction.dispose();
    _reactionListDisposer.reaction.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text('Weather Forecast'),
      ),
      body: Observer(builder: (_) {
        if (controller.weatherIsLoading) {
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.white,
            ),
          );
        }

        return _viewContent();
      }));

  Widget _viewContent() => Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextField(
            decoration: const InputDecoration(hintText: 'Enter a search term'),
            onSubmitted: controller.onGetWeatherByCityName,
          ),
          _weatherInfo(),
          _listOfCities(),
        ],
      ));

  Widget _weatherInfo() {
    if (controller.weatherObservable == null || controller.weatherHasError) {
      return Container(
        height: 0.0,
        width: 0.0,
      );
    }

    final weather = controller.weatherObservable?.value;

    return Column(
      children: <Widget>[
        Text(weather.description),
        const SizedBox(
          height: 10.0,
        ),
        Text(weather.main),
        const SizedBox(
          height: 10.0,
        ),
        Text('Temp: ${weather.temp.toString()}'),
        const SizedBox(
          height: 10.0,
        ),
        Text('Feels like: ${weather.feelsLike.toString()}'),
        const SizedBox(
          height: 10.0,
        ),
      ],
    );
  }

  Widget _listOfCities() {
    final cities = controller.citiesObservable?.value ?? [];

    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      itemCount: cities.length,
      shrinkWrap: true,
      itemBuilder: (context, index) => GestureDetector(
        child: Padding(
          padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
          child: Text(cities[index]),
        ),
      ),
    );
  }

  void _showError(String message) {
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text(
        message,
        style: const TextStyle(
          fontSize: 20,
        ),
        textAlign: TextAlign.center,
      ),
    ));
  }

  void _listenForWeatherError() {
    _reactionErrorDisposer = reaction(
      (_) => controller.weatherHasError,
      (value) => {
        if (value)
          {
            _showError('Something went wrong, try again!'),
          }
      },
    );
  }

  void _listenForUpdateCities() {
    _reactionListDisposer = reaction(
      (_) => controller.isFetchCitiesAgain,
      (value) => {
        if (value)
          {
            controller.getListOfSavedCities(),
          }
      },
    );
  }
}
