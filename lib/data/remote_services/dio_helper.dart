import 'dart:developer';

import 'package:dio/dio.dart';

class DioHelper {
  static final _dio = Dio();

  static Future<Response> post({
    required String path,
    required String? accessToken,
    required Map<String, dynamic> body,
    required FormData? data,
    required Map<String, dynamic> headers,
  }) async {
    headers = {
      'Content-Type': 'application/json',
      if (accessToken != null) 'Authorization': 'Bearer $accessToken',
      ...headers
    };
    Response response = await _dio.post(path,
        options: Options(
          headers: headers,
          // add those to avoid error 500
          followRedirects: false,
          validateStatus: (status) => true,
        ),
        queryParameters: body,
        data: data);
    log('POST: response:${response.data}||path:$path||body:$body||headers:$headers');
    return response;
  }

  static String statusCodeCallback(int statusCode) {
    if (statusCode >= 100 && statusCode <= 199) {
      return 'Error $statusCode Informational responses';
    } else if (statusCode >= 200 && statusCode <= 299) {
      return ''; //'Successful responses';
    } else if (statusCode >= 300 && statusCode <= 399) {
      return 'Error $statusCode Redirection messages';
    } else if (statusCode >= 400 && statusCode <= 499) {
      return 'Error $statusCode Client error responses';
    } else if (statusCode >= 500 && statusCode <= 599) {
      return 'Error $statusCode Server error responses';
    } else {
      return 'Error $statusCode Unknown';
    }
  }
}
