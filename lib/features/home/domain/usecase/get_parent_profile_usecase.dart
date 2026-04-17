import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/errors/failures.dart';
import '../entity/parent_entity.dart';
import '../repo/parent_repository.dart';

class GetParentProfileUseCase {
  final ParentRepository repository;

  GetParentProfileUseCase({required this.repository});

  Future<Either<Failure, ParentEntity>> call(String parentId) {
    return repository.getParentProfile(parentId);
  }
}