import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/core/bloc.dart';
import 'package:flutter_clean_architecture/di/service_locator.dart';

abstract class WidgetSate<T extends StatefulWidget, B extends Bloc>
    extends State<T> {
  B bloc;

  WidgetSate() {
    bloc = serviceLocator<B>();
  }

  @override
  void dispose() {
    bloc.onDispose();
    super.dispose();
  }
}
