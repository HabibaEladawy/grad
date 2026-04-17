// doctor_remote_data_source.dart
import 'package:dana_graduation_project/core/api/api_manger.dart';
import 'package:dio/dio.dart';

import '../../../../core/api/api_endpoint.dart';
import '../../../../core/errors/exceptions.dart';
import '../../domain/entity/doctor_entity.dart';
import '../model/doctor_model.dart';

// ── Abstract ─────────────────────────────────────────────────────────────────
abstract class DoctorRemoteDataSource {
  Future<List<DoctorEntity>> getAllDoctors();
  Future<DoctorEntity> getDoctorById(String doctorId);
}

class DoctorRemoteDataSourceImpl implements DoctorRemoteDataSource {
  final ApiManger apiManager;

  const DoctorRemoteDataSourceImpl({required this.apiManager});

  @override
  Future<List<DoctorEntity>> getAllDoctors() async {
    try {
      final response = await apiManager.getData(
        endPoint: ApiEndpoint.getAllDoctors,
        
      );
      

      print('✅ Responseeeeeeee: ${response.data}');

      final List doctors = response.data['data'] ?? [];

      return doctors
          .map((json) => DoctorModel.fromJson(json))
          .toList();

    } on DioException catch (e) {
      final message =
      e.response?.data is Map
          ? e.response?.data['message']
          : e.message;

      print('❌ Error: $message');

      throw ServerException(
        message: message ?? 'Server Error',
      );
    } catch (e) {
      print('❌ Unexpected Error: $e');

      throw ServerException(
        message: 'Unexpected Error occurred',
      );
    }
  }

  @override
  Future<DoctorEntity> getDoctorById(String doctorId) async {
    try {
      final response = await apiManager.getData(
        endPoint: '${ApiEndpoint.doctorById}/$doctorId',
      );

      print('✅ DoctorById Response: ${response.data}');

      return DoctorModel.fromJson(response.data['data']);

    } on DioException catch (e) {
      final message =
      e.response?.data is Map
          ? e.response?.data['message']
          : e.message;

      print('❌ DoctorById Error: $message');

      throw ServerException(
        message: message ?? 'Server Error',
      );
    } catch (e) {
      print('❌ Unexpected Error: $e');

      throw ServerException(
        message: 'Unexpected Error occurred',
      );
    }
  }
}