import 'package:dana_graduation_project/core/errors/failures.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/usecases/usecases.dart';
import '../entity/Video_Entity.dart';
import '../repo/Video_Repository.dart';



class GetAllVideosUseCase implements UseCase<List<VideoEntity>, NoParams> {
  final VideoRepository repository;

  const GetAllVideosUseCase(this.repository);

  @override
  Future<Either<Failure, List<VideoEntity>>> call(NoParams params) {
    return repository.getAllVideos();
  }
}