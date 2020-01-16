import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/ui/home_page.dart';

import 'di/service_locator.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  runZoned<Future<Null>>(() async {
    runApp(MyApp());
  }, onError: (error, stackTrace) async {
    print(error);
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: new ThemeData(
          primarySwatch: Colors.blue,
          canvasColor: Colors.white
      ),
      supportedLocales: [
        const Locale('en'),
      ],
      home: HomePage(),
    );
  }
}
