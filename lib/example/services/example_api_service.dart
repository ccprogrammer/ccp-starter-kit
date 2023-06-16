import 'dart:developer';

import 'package:ccp_starter/example/helper/example_helper.dart';
import 'package:dio/dio.dart';

class ExampleApiService {
  final Dio dio = Dio();

  static const _baseUrl = "https://reqres.in/api/";

  Future get({
    required String endpoint,
    bool useBaseUrl = true,
    dynamic body,
    bool isLog = false,
    bool showErrorDialog = false,
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

      var data = response.data;

      if (isLog) log('$url res: $data');

      if (showErrorDialog && data['status'] == false) {
        Helper.showPopUp(title: 'Rejected', message: '${data['message']}');
      }

      return res(data, response);
    } on DioException catch (e) {
      var statusCode = e.response?.statusCode;
      var statusMessage = e.response?.statusMessage;
      var othersError = e.message;
      var dioError = e.error;

      if (showErrorDialog) {
        Helper.showPopUp(title: '[$statusCode]', message: '$statusMessage');
      }

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
    bool showErrorDialog = false,
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

      var data = response.data;

      if (isLog) log('$url res: $data');

      if (showErrorDialog && data['status'] == false) {
        Helper.showPopUp(title: 'Rejected', message: '${data['message']}');
      }

      return res(data, response);
    } on DioException catch (e) {
      var statusCode = e.response?.statusCode;
      var statusMessage = e.response?.statusMessage;
      var othersError = e.message;
      var dioError = e.error;

      if (showErrorDialog) {
        Helper.showPopUp(title: '[$statusCode]', message: '$statusMessage');
      }

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
    bool showErrorDialog = false,
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

      var data = response.data;

      if (isLog) log('$url res: $data');

      if (showErrorDialog && data['status'] == false) {
        Helper.showPopUp(title: 'Rejected', message: '${data['message']}');
      }

      return res(response.data, response);
    } on DioException catch (e) {
      var statusCode = e.response?.statusCode;
      var statusMessage = e.response?.statusMessage;
      var othersError = e.message;
      var dioError = e.error;

      if (showErrorDialog) {
        Helper.showPopUp(title: '[$statusCode]', message: '$statusMessage');
      }

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
    bool showErrorDialog = false,
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

      var data = response.data;

      if (isLog) log('$url res: $data');

      if (showErrorDialog && data['status'] == false) {
        Helper.showPopUp(title: 'Rejected', message: '${data['message']}');
      }

      return res(response.data, response);
    } on DioException catch (e) {
      var statusCode = e.response?.statusCode;
      var statusMessage = e.response?.statusMessage;
      var othersError = e.message;
      var dioError = e.error;

      if (showErrorDialog) {
        Helper.showPopUp(title: '[$statusCode]', message: '$statusMessage');
      }

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
