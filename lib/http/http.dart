import 'dart:io';
import 'dart:convert';
import 'package:dio/dio.dart' as adio;
import 'package:total/http/handle.dart';
import 'package:total/util/tools.dart';


class Http {
  static const int CONNECT_TIMEOUT = 5000;
  static const int RECEIVE_TIMEOUT = 3000;

  static Future<AnHttpResponse> doGetPin(
      String url, Map<String, String> headers) async {
    adio.BaseOptions options = new adio.BaseOptions(
        connectTimeout: CONNECT_TIMEOUT, receiveTimeout: RECEIVE_TIMEOUT);

    Map result;
    adio.Dio dio = new adio.Dio(options);
    AnHttpResponse httpResponse;

    try {
      String tokenStr = await getStoreValue(JHActions.token());
      adio.Response response = await dio.get(url,
          options: adio.Options(headers: {
            HttpHeaders.contentTypeHeader: 'application/json',
            'authorization': '$tokenStr',
          }));

      if (response.statusCode == HttpStatus.ok) {
        result = await response.data;
      } else {
        result = {};
      }

      httpResponse = new AnHttpResponse(
          jsonEncode(result), response.statusCode, result['headers']);
    } on adio.DioError catch (e) {
      errorLog(url, e);
      return null;
    }

    return httpResponse;
  }

  static Future<AnHttpResponse> doPost(
      String url, body, Map<String, String> headers) async {
    adio.BaseOptions options = new adio.BaseOptions(
        connectTimeout: CONNECT_TIMEOUT, receiveTimeout: RECEIVE_TIMEOUT);

    Map result;
    adio.Dio dio = new adio.Dio(options);
    AnHttpResponse httpResponse;

    try {
      String tokenStr = await getStoreValue(JHActions.token());
      adio.Response response = await dio.post(url,
          data: body,
          queryParameters: body,
          options: adio.Options(headers: {
            HttpHeaders.contentTypeHeader: 'application/json',
            'authorization': '$tokenStr',
          }));

      if (response.statusCode == HttpStatus.ok) {
        result = await response.data;
      } else {
        result = {};
      }

      httpResponse = new AnHttpResponse(
          jsonEncode(result), response.statusCode, result['headers']);
    } on adio.DioError catch (e) {
      errorLog(url, e, body);
      return null;
    }

    return httpResponse;
  }

  static Future<AnHttpResponse> doPut(
      String url, body, Map<String, String> headers) async {
    adio.BaseOptions options = new adio.BaseOptions(
        connectTimeout: CONNECT_TIMEOUT, receiveTimeout: RECEIVE_TIMEOUT);

    Map result;
    adio.Dio dio = new adio.Dio(options);
    AnHttpResponse httpResponse;

    try {
      String tokenStr = await getStoreValue(JHActions.token());
      adio.Response response = await dio.put(url,
          data: body,
          options: adio.Options(headers: {
            HttpHeaders.contentTypeHeader: 'application/json',
            'authorization': '$tokenStr',
          }));

      if (response.statusCode == HttpStatus.ok) {
        result = await response.data;
      } else {
        result = {};
      }

      httpResponse = new AnHttpResponse(
          jsonEncode(result), response.statusCode, result['headers']);
    } on adio.DioError catch (e) {
      errorLog(url, e, body);
      return null;
    }

    return httpResponse;
  }

  static Future<AnHttpResponse> doDel(
      String url, body, Map<String, String> headers) async {
    adio.BaseOptions options = new adio.BaseOptions(
        connectTimeout: CONNECT_TIMEOUT, receiveTimeout: RECEIVE_TIMEOUT);

    Map result;
    adio.Dio dio = new adio.Dio(options);
    AnHttpResponse httpResponse;

    try {
      String tokenStr = await getStoreValue(JHActions.token());
      adio.Response response = await dio.delete(url,
          data: body,
          options: adio.Options(headers: {
            HttpHeaders.contentTypeHeader: 'application/json',
            'authorization': '$tokenStr',
          }));

      if (response.statusCode == HttpStatus.ok) {
        result = await response.data;
      } else {
        result = {};
      }

      httpResponse = new AnHttpResponse(
          jsonEncode(result), response.statusCode, result['headers']);
    } on adio.DioError catch (e) {
      errorLog(url, e, body);
      return null;
    }

    return httpResponse;
  }

  static Future<AnHttpResponse> doGet(
      String url, body, Map<String, String> headers) async {
    adio.BaseOptions options = new adio.BaseOptions(
        connectTimeout: CONNECT_TIMEOUT, receiveTimeout: RECEIVE_TIMEOUT);

    Map result;
    adio.Dio dio = new adio.Dio(options);
    AnHttpResponse httpResponse;

    try {
      String tokenStr = await getStoreValue(JHActions.token());
      adio.Response response = await dio.get(url,
          queryParameters: body,
          options: adio.Options(headers: {
            HttpHeaders.contentTypeHeader: 'application/json',
            'authorization': '$tokenStr',
          }));

      if (response.statusCode == HttpStatus.ok) {
        result = await response.data;
      } else {
        result = {};
      }

      httpResponse = new AnHttpResponse(
          jsonEncode(result), response.statusCode, result['headers']);
    } on adio.DioError catch (e) {
      errorLog(url, e, body);
      return null;
    }

    return httpResponse;
  }
}

class AnHttpResponse {
  final String body;
  final int code;
  final Map headers;

  AnHttpResponse(this.body, this.code, this.headers);
}
