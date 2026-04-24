

import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entity/question_entity.dart';

abstract class QuestionRepository {
Future<Either<Failure, List<QuestionEntity>>> getQuestions();
Future<Either<Failure, QuestionEntity>> insertQuestion(QuestionEntity question);
Future<Either<Failure, bool>> deleteQuestion(int id);
Future<Either<Failure, QuestionEntity>> updateQuestion(QuestionEntity question);
}