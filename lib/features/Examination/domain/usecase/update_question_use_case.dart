import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entity/question_entity.dart';
import '../repo/question_repository.dart';
import 'base_use_case.dart';

class UpdateQuestionUseCase
    extends BaseUseCase<QuestionEntity, QuestionEntity> {
  final QuestionRepository repository;

   UpdateQuestionUseCase(this.repository);

  @override
  Future<Either<Failure, QuestionEntity>> call(QuestionEntity params) {
    return repository.updateQuestion(params);
  }
}