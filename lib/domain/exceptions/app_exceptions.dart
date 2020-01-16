class AppException implements Exception {
  final message;
  final _prefix;

  AppException([this.message, this._prefix]);

  String toString() {
    return "$_prefix$message";
  }
}

class NetworkException extends AppException {
  NetworkException() : super("Check your internet connection and try again!");
}

class FetchDataException extends AppException {
  FetchDataException([String message]) : super(message, "Error During Communication: ");
}

class BadRequestException extends AppException {
  BadRequestException([message]) : super(message, "Something went wrong, please try again");
}

class UnauthorisedException extends AppException {
  UnauthorisedException([message]) : super(message, "There is a problem with you authentication, please try again!");
}

class MissingParamsException extends AppException {
  MissingParamsException() : super("There is some missing params, check the widget for further information!");
}
