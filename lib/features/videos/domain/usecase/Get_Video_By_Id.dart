import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entity/Video_Entity.dart';
import '../repo/Video_Repository.dart';
import 'base_usecase.dart';

class GetVideoByIdParams {
  final String id;
  const GetVideoByIdParams({required this.id});
}

class GetVideoByIdUseCase implements UseCase<VideoEntity, GetVideoByIdParams> {
  final VideoRepository repository;

  const GetVideoByIdUseCase(this.repository);

  @override
  Future<Either<Failure, VideoEntity>> call(GetVideoByIdParams params) {
    return repository.getVideoById(params.id);
  }
}