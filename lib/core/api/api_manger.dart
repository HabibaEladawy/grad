import 'package:dio/dio.dart';
import 'api_constant.dart';

class ApiManger {
  final Dio dio;

  ApiManger(this.dio);

  Future<Response> getData({
    required String endPoint,
    Map<String, dynamic>? qureyParmetes,
    Map<String, dynamic>? headers,
  }) {
    return dio.get(
      ApiConstant.baseUrl + endPoint,
      queryParameters: qureyParmetes,
      options: Options(headers: headers),
    );
  }

  Future<Response> postData({
    required String endPoint,
    Map<String, dynamic>? qureyParmetes,
    Object? body,
    Map<String, dynamic>? headers,
  }) {
    return dio.post(
      ApiConstant.baseUrl + endPoint,
      queryParameters: qureyParmetes,
      data: body,
      options: Options(headers: headers),
    );
  }
}