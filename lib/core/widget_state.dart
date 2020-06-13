import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/di/di.dart';
import 'package:mobx/mobx.dart';

abstract class WidgetSate<Widget extends StatefulWidget,
    Controller extends Store> extends State<Widget> {
  final Controller controller = getIt<Controller>();
}
