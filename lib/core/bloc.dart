import 'dart:async';

import 'package:flutter_clean_architecture/core/app_state.dart';

abstract class Bloc {
  final StreamController<AppState> streamController = StreamController<AppState>.broadcast();
  Stream<AppState> get onStateChange => streamController.stream;

  void onDispose() {
    streamController.close();
  }
}
