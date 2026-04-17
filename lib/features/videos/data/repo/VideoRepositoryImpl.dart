
import '../model/Response_Video_Model.dart';

abstract class VideoRemoteDataSource {
  Future<List<VideoModel>> getAllVideos();
  Future<VideoModel> getVideoById(String id);
  Future<List<VideoModel>> searchVideos(String query);
}
