import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entity/question_entity.dart';
import '../repo/question_repository.dart';
import 'base_use_case.dart';

class InsertQuestionUseCase
    extends BaseUseCase<QuestionEntity, QuestionEntity> {
  final QuestionRepository repository;

   InsertQuestionUseCase(this.repository);

  @override
  Future<Either<Failure, QuestionEntity>> call(QuestionEntity params) {
    return repository.insertQuestion(params);
  }
}