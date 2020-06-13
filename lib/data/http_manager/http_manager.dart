abstract class HttpManager {
  Future<dynamic> get({
    String url,
    Map<String, dynamic> query,
    Map<String, String> headers,
  });

  Future<dynamic> post({
    String url,
    Map body,
    Map<String, dynamic> query,
    Map<String, String> headers,
  });

  Future<dynamic> put({
    String url,
    Map body,
    Map<String, dynamic> query,
    Map<String, String> headers,
  });

  Future<dynamic> delete({
    String url,
    Map<String, dynamic> query,
    Map<String, String> headers,
  });
}
