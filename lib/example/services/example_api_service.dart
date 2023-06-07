import 'dart:developer';

import 'package:dio/dio.dart';

class ApiService {
  final Dio dio = Dio();

  static const _baseUrl = "https://reqres.in/api/";

  Future get({
    required String endpoint,
    bool useBaseUrl = true,
    dynamic body,
    bool isLog = false,
    required Function(dynamic res, Response response) res,
    required Function(int? statusCode, String? statusMessage,
            String? othersError, dynamic dioError)
        onError,
  }) async {
    Map<String, dynamic> requestHeaders = {
      "Content-Type": "application/json",
      "Accept": "application/json",
      'Authorization': 'Bearer ',
    };

    try {
      String url = '${useBaseUrl ? _baseUrl : ''}$endpoint';

      Response response =
          await dio.get(url, options: Options(headers: requestHeaders));

      if (isLog) log('$url res: ${response.data}');

      return res(response.data, response);
    } on DioException catch (e) {
      var statusCode = e.response?.statusCode;
      var statusMessage = e.response?.statusMessage;
      var othersError = e.message;
      var dioError = e.error;

      log('endpoint === $endpoint \nstatusCode === $statusCode \nstatusMessage === $statusMessage \nothersError === $othersError \ndioError === $dioError');

      return onError(
        statusCode,
        statusMessage,
        othersError,
        dioError,
      );
    }
  }

  Future post({
    required String endpoint,
    bool useBaseUrl = true,
    Map<String, dynamic>? body,
    bool isLog = false,
    required Function(dynamic res, Response response) res,
    required Function(int? statusCode, String? statusMessage,
            String? othersError, dynamic dioError)
        onError,
  }) async {
    Map<String, dynamic> requestHeaders = {
      "Content-Type": "application/json",
      "Accept": "application/json",
      'Authorization': 'Bearer ',
    };

    try {
      String url = '${useBaseUrl ? _baseUrl : ''}$endpoint';

      Response response = await dio.post(
        url,
        data: body,
        options: Options(headers: requestHeaders),
      );

      if (isLog) log('$url res: ${response.data}');

      return res(response.data, response);
    } on DioException catch (e) {
      var statusCode = e.response?.statusCode;
      var statusMessage = e.response?.statusMessage;
      var othersError = e.message;
      var dioError = e.error;

      log('endpoint === $endpoint \nstatusCode === $statusCode \nstatusMessage === $statusMessage \nothersError === $othersError \ndioError === $dioError');

      return onError(
        statusCode,
        statusMessage,
        othersError,
        dioError,
      );
    }
  }

  Future put({
    required String endpoint,
    bool useBaseUrl = true,
    Map<String, dynamic>? body,
    bool isLog = false,
    required Function(dynamic res, Response response) res,
    required Function(int? statusCode, String? statusMessage,
            String? othersError, dynamic dioError)
        onError,
  }) async {
    Map<String, dynamic> requestHeaders = {
      "Content-Type": "application/json",
      "Accept": "application/json",
      'Authorization': 'Bearer ',
    };

    try {
      String url = '${useBaseUrl ? _baseUrl : ''}$endpoint';

      Response response = await dio.post(
        url,
        data: body,
        options: Options(headers: requestHeaders),
      );

      if (isLog) log('$url res: ${response.data}');

      return res(response.data, response);
    } on DioException catch (e) {
      var statusCode = e.response?.statusCode;
      var statusMessage = e.response?.statusMessage;
      var othersError = e.message;
      var dioError = e.error;

      log('endpoint === $endpoint \nstatusCode === $statusCode \nstatusMessage === $statusMessage \nothersError === $othersError \ndioError === $dioError');

      return onError(
        statusCode,
        statusMessage,
        othersError,
        dioError,
      );
    }
  }

  Future delete({
    required String endpoint,
    bool useBaseUrl = true,
    Map<String, dynamic>? body,
    bool isLog = false,
    required Function(dynamic res, Response response) res,
    required Function(int? statusCode, String? statusMessage,
            String? othersError, dynamic dioError)
        onError,
  }) async {
    Map<String, dynamic> requestHeaders = {
      "Content-Type": "application/json",
      "Accept": "application/json",
      'Authorization': 'Bearer ',
    };

    try {
      String url = '${useBaseUrl ? _baseUrl : ''}$endpoint';

      Response response = await dio.delete(
        url,
        data: body,
        options: Options(headers: requestHeaders),
      );

      if (isLog) log('$url res: ${response.data}');

      return res(response.data, response);
    } on DioException catch (e) {
      var statusCode = e.response?.statusCode;
      var statusMessage = e.response?.statusMessage;
      var othersError = e.message;
      var dioError = e.error;

      log('endpoint === $endpoint \nstatusCode === $statusCode \nstatusMessage === $statusMessage \nothersError === $othersError \ndioError === $dioError');

      return onError(
        statusCode,
        statusMessage,
        othersError,
        dioError,
      );
    }
  }
}
