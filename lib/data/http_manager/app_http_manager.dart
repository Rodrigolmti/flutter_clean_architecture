import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter_clean_architecture/core/constants.dart';
import 'package:flutter_clean_architecture/data/http_manager/http_manager.dart';
import 'package:flutter_clean_architecture/domain/exceptions/app_exceptions.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';

const timeout = Duration(seconds: 3);

@Singleton(as: HttpManager)
class AppHttpManager implements HttpManager {
  @override
  Future get({
    String url,
    Map<String, dynamic> query,
    Map<String, String> headers,
  }) async {
    try {
      print('Api Get request url $url');
      final response = await http
          .get(_queryBuilder(url, query), headers: _headerBuilder(headers))
          .timeout(timeout, onTimeout: () => throw TimeoutException());
      return _returnResponse(response);
    } on Exception catch (_) {
      throw NetworkException();
    }
  }

  @override
  Future<dynamic> post({
    String url,
    Map body,
    Map<String, dynamic> query,
    Map<String, String> headers,
  }) async {
    try {
      print('Api Post request url $url, with $body');
      final response = await http
          .post(_queryBuilder(url, query),
              body: body != null ? json.encode(body) : null,
              headers: _headerBuilder(headers))
          .timeout(timeout, onTimeout: () => throw TimeoutException());
      return _returnResponse(response);
    } on Exception catch (_) {
      throw NetworkException();
    }
  }

  @override
  Future<dynamic> put({
    String url,
    Map body,
    Map<String, dynamic> query,
    Map<String, String> headers,
  }) async {
    try {
      print('Api Put request url $url, with $body');
      final response = await http
          .put(_queryBuilder(url, query),
              body: json.encode(body), headers: _headerBuilder(headers))
          .timeout(timeout, onTimeout: () => throw TimeoutException());
      return _returnResponse(response);
    } on Exception catch (_) {
      throw NetworkException();
    }
  }

  @override
  Future<dynamic> delete({
    String url,
    Map<String, dynamic> query,
    Map<String, String> headers,
  }) async {
    try {
      print('Api Delete request url $url');
      final response = await http
          .delete(_queryBuilder(url, query), headers: _headerBuilder(headers))
          .timeout(timeout, onTimeout: () => throw TimeoutException());
      return _returnResponse(response);
    } on Exception catch (_) {
      throw NetworkException();
    }
  }

  Map<String, String> _headerBuilder(Map<String, String> headers) {
    final headers = <String, String>{};
    headers[HttpHeaders.acceptHeader] = 'application/json';
    headers[HttpHeaders.contentTypeHeader] = 'application/json';
    if (headers != null && headers.isNotEmpty) {
      headers.forEach((key, value) {
        headers[key] = value;
      });
    }
    return headers;
  }

  String _queryBuilder(String path, Map<String, dynamic> query) {
    final buffer = StringBuffer()..write(serverUrl + path);
    if (query != null) {
      if (query.isNotEmpty) {
        buffer.write('?');
      }
      query.forEach((key, value) {
        buffer.write('$key=$value&');
      });
    }
    return buffer.toString();
  }

  dynamic _returnResponse(http.Response response) {
    final responseJson = json.decode(response.body.toString());
    if (response.statusCode >= 200 && response.statusCode <= 299) {
      print('Api response success with $responseJson');
      return responseJson;
    }
    print('Api response error with ${response.statusCode} + ${response.body}');
    switch (response.statusCode) {
      case 400:
        throw BadRequestException();
      case 401:
      case 403:
        throw UnauthorisedException();
      case 500:
      default:
        throw ServerException();
    }
  }
}
