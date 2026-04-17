

import '../../../../core/errors/failures.dart';
import '../../domain/entity/parent_entity.dart';
import '../../domain/repo/parent_repository.dart';

import 'package:dartz/dartz.dart';

import '../repo/Parent_Remote_DataSource.dart';

class ParentRepositoryImpl implements ParentRepository {
  final ParentRemoteDataSource remoteDataSource;
  const ParentRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, ParentEntity>> getParentProfile(String parentId) async {
    try {
      final result = await remoteDataSource.getParentProfile(parentId);
      return Right(result);
    } on ServerFailure catch (e) {
      return Left(e);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}