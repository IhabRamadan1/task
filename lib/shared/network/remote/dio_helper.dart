import 'package:dio/dio.dart';

class DioHelper {
  static Dio? dio;

   static init()
   {
     dio = Dio(
       BaseOptions(
         baseUrl: 'https://live-job.dr-recruiter.com/api/guest/',
         receiveDataWhenStatusError: true,
       )
     );
   }


   static Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
  }) async
  {
    return await dio!.get(
      url,
      queryParameters: query??null,
    );
  }

   static Future<Response> postData({
    required String url,
    Map<String, dynamic>? query,
    required Map<String, dynamic> data,
  }) async
  {
    dio!.options.headers={
      'Content-Type':'multipart/form-data',
    };
    return await dio!.post(
      url,
      queryParameters: query,
      data: data,
    );
  }
}