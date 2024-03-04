import 'package:dio/dio.dart';

import '../../presentation/another_pages/base_urls.dart';
import 'dio_helper.dart';

class DioServices {
  static Future<dynamic> _post(String path,
      {FormData? data,
      Map<String, dynamic>? body,
      Map<String, dynamic>? headers,
      String? accessToken}) async {
    try {
      final response = await DioHelper.post(
          path: path,
          body: body ?? {},
          data: data,
          headers: headers ?? {},
          accessToken: accessToken);
      final error = DioHelper.statusCodeCallback(response.statusCode ?? -1);
      if (error.isEmpty) {
        // success
        return response.data as Map;
      } else {
        return throw Exception(error);
      }
    } on DioException catch (e) {
      final message = e.message ?? DioHelper.statusCodeCallback(-1);
      return message;
    } catch (e) {
      final message = e;
      return message;
    }
  }

  static Future<dynamic> uploadVideo(String path) async =>
      _post(BaseUrls.upload_video,
          data: FormData.fromMap({'file': await MultipartFile.fromFile(path)}));
}
