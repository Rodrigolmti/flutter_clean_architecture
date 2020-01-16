abstract class AppState {}

class Loading extends AppState {}

class Success<T> extends AppState {
  final T data;

  Success([this.data]);
}

class Failure extends AppState {
  final String message;

  Failure([this.message]);
}
