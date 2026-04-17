import 'package:dio/dio.dart';

import '../../../../core/api/api_manger.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failures.dart';
import '../model/parent_model.dart';

// parent_remote_data_source.dart
abstract class ParentRemoteDataSource {
  Future<ParentModel> getParentProfile(String parentId);
}

class ParentRemoteDataSourceImpl implements ParentRemoteDataSource {
  final Dio dio;

  ParentRemoteDataSourceImpl({required this.dio});

  @override
  Future<ParentModel> getParentProfile(String parentId) async {
    try {
      final response = await dio.get('/parent/$parentId');

      if (response.statusCode == 200) {
        return ParentModel.fromJson(response.data);
      } else {
        throw ServerException(message: 'فشل تحميل البيانات');
      }
    } on DioException catch (e) {
      throw ServerException(message: e.message ?? 'خطأ في الاتصال');
    }
  }
}