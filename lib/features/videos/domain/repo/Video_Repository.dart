import 'package:dana_graduation_project/core/errors/failures.dart';
import 'package:dartz/dartz.dart';

import '../entity/Video_Entity.dart';



abstract interface class VideoRepository {
  Future<Either<Failure, List<VideoEntity>>> getAllVideos();

  Future<Either<Failure, VideoEntity>> getVideoById(String id);
  Future<Either<Failure, List<VideoEntity>>> searchVideos(String query);
}