import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../repo/question_repository.dart';
import 'base_use_case.dart';

class DeleteQuestionUseCase extends BaseUseCase<bool, int> {
  final QuestionRepository repository;

   DeleteQuestionUseCase(this.repository);

  @override
  Future<Either<Failure, bool>> call(int id) {
    return repository.deleteQuestion(id);
  }
}