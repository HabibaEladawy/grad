import 'package:sqflite/sqflite.dart';
import '../model/question_model.dart';

abstract class QuestionLocalDataSource {
  Future<List<QuestionModel>> getQuestions();
  Future<QuestionModel> insertQuestion(QuestionModel question);
  Future<bool> deleteQuestion(int id);
  Future<QuestionModel> updateQuestion(QuestionModel question);
}

class QuestionLocalDataSourceImpl implements QuestionLocalDataSource {
  final Database database;

  const QuestionLocalDataSourceImpl({required this.database});

  static const String _tableName = 'questions';

  @override
  Future<List<QuestionModel>> getQuestions() async {
    final List<Map<String, dynamic>> maps = await database.query(_tableName);
    return maps.map((map) => QuestionModel.fromMap(map)).toList();
  }

  @override
  Future<QuestionModel> insertQuestion(QuestionModel question) async {
    final id = await database.insert(
      _tableName,
      question.toMap()..remove('id'),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    return QuestionModel.fromMap({...question.toMap(), 'id': id});
  }

  @override
  Future<bool> deleteQuestion(int id) async {
    final rowsAffected = await database.delete(
      _tableName,
      where: 'id = ?',
      whereArgs: [id],
    );
    return rowsAffected > 0;
  }

  @override
  Future<QuestionModel> updateQuestion(QuestionModel question) async {
    await database.update(
      _tableName,
      question.toMap(),
      where: 'id = ?',
      whereArgs: [question.id],
    );
    return question;
  }
}