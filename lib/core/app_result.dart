enum Status { SUCCESS, FAILURE }

class AppResult<T> {
  Status status;
  String message;
  T data;

  AppResult.success([this.data]) : status = Status.SUCCESS;

  AppResult.failure([this.message]) : status = Status.FAILURE;

  T handleResult(
      {Function(T) onSuccess, Function(String) onError, Function onFinish}) {
    switch (status) {
      case Status.SUCCESS:
        onSuccess(data);
        return data;
        break;
      case Status.FAILURE:
        onError(message);
        return data;
        break;
    }
    onFinish(status);
    return data;
  }

  AppResult<T> mapSuccess(Function(T) transform) {
    switch (status) {
      case Status.SUCCESS:
        return transform(data);
        break;
      case Status.FAILURE:
        break;
    }
    return this;
  }

  AppResult<T> mapError(Function(String) transform) {
    switch (status) {
      case Status.SUCCESS:
        break;
      case Status.FAILURE:
        return transform(message);
        break;
    }
    return this;
  }

  AppResult<T> flatMap({Function(T) onSuccess, Function(String) onError}) {
    switch (status) {
      case Status.SUCCESS:
        onSuccess(data);
        break;
      case Status.FAILURE:
        onError(message);
        break;
    }
    return this;
  }
}
