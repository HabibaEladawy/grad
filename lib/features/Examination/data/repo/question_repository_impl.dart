import 'dart:io';
import 'package:dartz/dartz.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failures.dart';
import '../../domain/entity/question_entity.dart';
import '../../domain/repo/question_repository.dart';
import '../datasource/question_local_data_source.dart';
import '../datasource/question_remote_data_source.dart';
import '../model/question_model.dart';

class QuestionRepositoryImpl implements QuestionRepository {
  final QuestionRemoteDataSource remoteDataSource;
  final QuestionLocalDataSource localDataSource;

  const QuestionRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<Either<Failure, List<QuestionEntity>>> getQuestions() async {
    try {
      // 1️⃣ جرب الـ local أول
      final localQuestions = await localDataSource.getQuestions();

      if (localQuestions.isNotEmpty) {
        // ✅ عنده data → رجّعها
        return Right(localQuestions);
      }

      // 2️⃣ الـ local فاضي → جيب من API
      final remoteQuestions = await remoteDataSource.getQuestions();

      // 3️⃣ احفظ كل سؤال في الـ local
      for (final question in remoteQuestions) {
        await localDataSource.insertQuestion(question);
      }

      return Right(remoteQuestions);

    } on SocketException {
      // لو مفيش نت وكمان local فاضي
      return Left(NetworkFailure(message: 'لا يوجد اتصال بالإنترنت'));
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    } catch (e) {
      return Left(UnknownFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, QuestionEntity>> insertQuestion(
    QuestionEntity question,
  ) async {
    try {
      final model = QuestionModel.fromEntity(question);
      final result = await localDataSource.insertQuestion(model);
      return Right(result);
    } on SocketException {
      return Left(NetworkFailure(message: 'لا يوجد اتصال بالإنترنت'));
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    } catch (e) {
      return Left(UnknownFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> deleteQuestion(int id) async {
    try {
      final result = await localDataSource.deleteQuestion(id);
      return Right(result);
    } on SocketException {
      return Left(NetworkFailure(message: 'لا يوجد اتصال بالإنترنت'));
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    } catch (e) {
      return Left(UnknownFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, QuestionEntity>> updateQuestion(
    QuestionEntity question,
  ) async {
    try {
      final model = QuestionModel.fromEntity(question);
      final result = await localDataSource.updateQuestion(model);
      return Right(result);
    } on SocketException {
      return Left(NetworkFailure(message: 'لا يوجد اتصال بالإنترنت'));
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    } catch (e) {
      return Left(UnknownFailure(message: e.toString()));
    }
  }
}