import 'package:dio/dio.dart';

import 'api_constant.dart';

class ApiManger {
  Dio dio = Dio();


  Future<Response>getData({required String endPoint,
    Map<String,dynamic>?qureyParmetes,
    Options?options,
    Map<String,dynamic>?headers,})

  {
    return dio.get(ApiConstant.baseUrl+endPoint,
        queryParameters:qureyParmetes,
        options:Options(headers:headers) );
  }


  Future<Response>postData({required String endPoint,
    Map<String,dynamic>?qureyParmetes,
    Object?body,
    Options?options,
    Map<String,dynamic>?headers,})

  {
    return dio.post(ApiConstant.baseUrl+endPoint,
        queryParameters:qureyParmetes,
        data: body,
        options:Options(headers:headers) );
  }
}
// class ApiManager {
//   static final ApiManager _instance = ApiManager._internal();
//   factory ApiManager() => _instance;
//
//   late final Dio _dio;
//
//   ApiManager._internal() {
//     _dio = Dio(
//       BaseOptions(
//         baseUrl: ApiConstant.baseUrl,
//         connectTimeout: const Duration(seconds: 10),
//         receiveTimeout: const Duration(seconds: 10),
//         headers: {'Content-Type': 'application/json'},
//       ),
//     );
//     _dio.interceptors.add(
//       LogInterceptor(requestBody: true, responseBody: true),
//     );
//   }
//
//   Future<Response> getData({
//     required String endPoint,
//     Map<String, dynamic>? queryParameters,
//     Map<String, dynamic>? headers,
//     Options? options,
//   }) async {
//     return _dio.get(
//       endPoint,
//       queryParameters: queryParameters,
//       options: (options ?? Options()).copyWith(headers: headers),
//     );
//   }
//
//   Future<Response> postData({
//     required String endPoint,
//     Map<String, dynamic>? queryParameters,
//     Object? body,
//     Map<String, dynamic>? headers,
//     Options? options,
//   }) async {
//     return _dio.post(
//       endPoint,
//       queryParameters: queryParameters,
//       data: body,
//       options: (options ?? Options()).copyWith(headers: headers),
//     );
//   }
// }