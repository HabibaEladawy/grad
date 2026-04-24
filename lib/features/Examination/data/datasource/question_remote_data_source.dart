import 'package:dana_graduation_project/core/api/api_endpoint.dart';
import 'package:dana_graduation_project/core/api/api_manger.dart';

import '../model/question_model.dart';


abstract class QuestionRemoteDataSource {
  Future<List<QuestionModel>> getQuestions();
}

class QuestionRemoteDataSourceImpl implements QuestionRemoteDataSource {
  final ApiManger apiManger;

  const QuestionRemoteDataSourceImpl({required this.apiManger});

  @override
  Future<List<QuestionModel>> getQuestions() async {
    final response = await apiManger.getData(
      endPoint: ApiEndpoint.sensoryTest,
    );
    final List<dynamic> jsonList = response.data;
    return jsonList.map((json) => QuestionModel.fromJson(json)).toList();
  }
}