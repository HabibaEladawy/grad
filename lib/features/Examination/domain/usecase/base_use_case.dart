import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';

abstract class BaseUseCase<Output, Input> {
  Future<Either<Failure, Output>> call(Input params);
}