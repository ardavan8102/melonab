import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:dio/dio.dart' as dio_service;

class DioService {

  Dio dio = Dio();

  Future<dynamic> getMethod(String url) async {

    dio.options.headers['Content-Type'] = 'application/json';

    return await dio.get(
      url,
      options: Options(
        responseType: .json,
        method: 'GET',
      ),
    ).then((response) {

      log('GET method : ${response.toString()}');
      return response;

    }).catchError((error) {

      if (error is DioException) {
        return error.response!;
      } else {
        return error;
      }

    });

  }


  Future<Response?> postMethod(String url, Map<String, dynamic> map) async {

    try {
      
      final response = await dio.post(
        url,
        data: dio_service.FormData.fromMap(map),
        options: Options(
          responseType: .json,
          method: 'POST'
        )
      );

      log('POST method : ${response.toString()}');
      return response;

    } on DioException catch (e) {
      log('🔥 DioException.type: ${e.type}');
      log('🔥 DioException.message: ${e.message}');
      log('🔥 DioException.error: ${e.error}');
      log('🔥 DioException.response: ${e.response}');
      return e.response;
    }

  }

}