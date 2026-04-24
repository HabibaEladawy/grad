import 'package:dana_graduation_project/core/usecases/usecases.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entity/question_entity.dart';
import '../repo/question_repository.dart';
import 'base_use_case.dart';

class GetQuestionsUseCase extends BaseUseCase<List<QuestionEntity>, NoParams> {
  final QuestionRepository repository;

   GetQuestionsUseCase(this.repository);

  @override
  Future<Either<Failure, List<QuestionEntity>>> call(NoParams params) {
    return repository.getQuestions();
  }
}