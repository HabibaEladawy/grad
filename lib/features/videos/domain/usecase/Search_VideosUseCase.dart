// domain/usecases/search_videos_usecase.dart
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entity/Video_Entity.dart';
import '../repo/Video_Repository.dart';

class SearchVideosUseCase {
  final VideoRepository repository;
  const SearchVideosUseCase(this.repository);

  Future<Either<Failure, List<VideoEntity>>> call(String query) {
    return repository.searchVideos(query);
  }
}