
import 'package:dana_graduation_project/core/api/api_endpoint.dart';
import 'package:dana_graduation_project/features/videos/data/model/Response_Video_Model.dart';
import 'package:dio/dio.dart';
import '../../../../core/api/api_manger.dart';
import '../../../../core/errors/exceptions.dart';
import '../repo/VideoRepositoryImpl.dart';

class VideoRemoteDataSourceImpl implements VideoRemoteDataSource {
  final ApiManger apiManger;

  const VideoRemoteDataSourceImpl({required this.apiManger});

  @override
  Future<List<VideoModel>> getAllVideos() async {
    try {
      final response = await apiManger.getData(endPoint: ApiEndpoint.videos);
      final List<dynamic> jsonList = response.data;

      if (jsonList.isEmpty) {
        throw ServerException(message: ' لا توجد فيديوهاتً');
      }

      return jsonList.map((json) => VideoModel.fromJson(json)).toList();
    } on DioException catch (e) {
      _handleDioException(e);
      rethrow;
    }
  }

  @override
  Future<VideoModel> getVideoById(String id) async {
    try {
      final response = await apiManger.getData(endPoint: ApiEndpoint.videoById);
      return VideoModel.fromJson(response.data);
    } on DioException catch (e) {
      _handleDioException(e);
      rethrow;
    }
  }

  @override
  Future<List<VideoModel>> searchVideos(String query) async {
    try {
      final response = await apiManger.getData(endPoint: ApiEndpoint.videos);
      final List<dynamic> jsonList = response.data;
      final allVideos = jsonList.map((json) => VideoModel.fromJson(json)).toList();

      final result = allVideos.where((video) =>
          video.title.toLowerCase().contains(query.toLowerCase())
      ).toList();

      if (result.isEmpty) {
        throw ServerException(message: '🔍 لا توجد نتائج للبحث عن "$query"');
      }

      return result;
    } on DioException catch (e) {
      _handleDioException(e);
      rethrow;
    }
  }

  void _handleDioException(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionError:
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.receiveTimeout:
        throw NetworkException(message: '❌ لا يوجد اتصال بالإنترنت');
      case DioExceptionType.badResponse:
        print('Status: ${e.response?.statusCode}');
        print('Body: ${e.response?.data}');
        throw ServerException(
          message: '❌ خطأ في السيرفر: ${e.message}',
        );
      default:
        throw ServerException(message: '❌ خطأ غير متوقع');
    }
  }
}