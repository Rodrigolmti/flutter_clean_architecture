import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/di/di.dart';
import 'package:flutter_clean_architecture/ui/home_page.dart';

import 'di/di.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await configureInjection();

  return runZonedGuarded(() async {
    runApp(MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue, canvasColor: Colors.white),
      home: HomePage(),
    ));
  }, (error, stack) {
    print(stack);
    print(error);
  });
}