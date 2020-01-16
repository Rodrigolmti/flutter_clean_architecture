import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/core/app_state.dart';
import 'package:flutter_clean_architecture/core/widget_state.dart';
import 'package:flutter_clean_architecture/domain/model/weather.dart';
import 'package:flutter_clean_architecture/ui/home_bloc.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends WidgetSate<HomePage, HomeBloc> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  final List<String> _cities = List();

  @override
  void initState() {
    bloc.streamController.stream.listen((data) {
      if (data is Failure) showError(data.message);
      if (data is OnGetSavedCities) {
        setState(() {
          _cities.clear();
          _cities.addAll(data.cities);
        });
      }
    });
    bloc.getListOfSavedCities();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Weather Forecast'),
      ),
      body: StreamBuilder(
        stream: bloc.streamController.stream,
        builder: (context, AsyncSnapshot<AppState> snapshot) {
          if (snapshot.hasData && snapshot.data is Loading)
            return Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.white,
              ),
            );
          if (snapshot.hasData && snapshot.data is Success) {
            final Weather weather = (snapshot.data as Success).data;

            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(weather.description),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(weather.main),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text('Temp: ${weather.temp.toString()}'),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text('Feels like: ${weather.feelsLike.toString()}'),
                  SizedBox(
                    height: 10.0,
                  ),
                  TextField(
                    decoration:
                        InputDecoration(hintText: 'Enter a search term'),
                    onSubmitted: (value) {
                      bloc.onGetWeatherByCityName(value);
                    },
                  ),
                  listOfCities()
                ],
              ),
            );
          }
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextField(
                  decoration: InputDecoration(hintText: 'Enter a search term'),
                  onSubmitted: (value) {
                    bloc.onGetWeatherByCityName(value);
                  },
                ),
                listOfCities()
              ],
            ),
          );
        },
      ),
    );
  }

  Widget listOfCities() {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      itemCount: _cities.length,
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) => GestureDetector(
        child: Padding(
          padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
          child: Text(_cities[index]),
        ),
      ),
    );
  }

  void showError(String message) {
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text(
        message,
        style: TextStyle(
          fontSize: 20,
        ),
        textAlign: TextAlign.center,
      ),
    ));
  }
}
