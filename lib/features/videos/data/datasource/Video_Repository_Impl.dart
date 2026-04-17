import 'package:dartz/dartz.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/entity/Video_Entity.dart';
import '../../domain/repo/Video_Repository.dart';
import '../repo/VideoRepositoryImpl.dart';

class VideoRepositoryImpl implements VideoRepository {
  final VideoRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  const VideoRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<VideoEntity>>> getAllVideos() async {
    return await _handleRequest(() => remoteDataSource.getAllVideos());
  }

  @override
  Future<Either<Failure, VideoEntity>> getVideoById(String id) async {
    return await _handleRequest(() => remoteDataSource.getVideoById(id));
  }

  @override
  Future<Either<Failure, List<VideoEntity>>> searchVideos(String query) async {
    return await _handleRequest(() => remoteDataSource.searchVideos(query));
  }

  Future<Either<Failure, T>> _handleRequest<T>(
      Future<T> Function() request,
      ) async {
    if (!await networkInfo.isConnected) {
      return Left(NetworkFailure(message: '❌ لا يوجد اتصال بالإنترنت'));
    }
    try {
      final result = await request();
      return Right(result);
    } on NetworkException catch (e) {
      return Left(NetworkFailure(message: e.message));
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    } catch (e) {
      return Left(UnknownFailure(message: e.toString()));
    }
  }
}