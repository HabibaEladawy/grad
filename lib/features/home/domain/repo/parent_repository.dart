import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entity/parent_entity.dart';


abstract class ParentRepository {
  Future<Either<Failure, ParentEntity>> getParentProfile(String parentId);
}