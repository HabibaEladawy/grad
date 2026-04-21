import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';

import '../../../../core/api/api_endpoint.dart';
import '../../../../core/errors/exceptions.dart';
import '../models/parent_profile_model.dart';
import 'parent_profile_remote_data_source.dart';

class ParentProfileRemoteDataSourceImpl implements ParentProfileRemoteDataSource {
  final Dio dio;

  ParentProfileRemoteDataSourceImpl({required this.dio});

  dynamic _decode(dynamic raw) => raw is String ? jsonDecode(raw) : raw;

  Map<String, dynamic> _unwrapData(dynamic decoded) {
    if (decoded is Map && decoded['response'] is Map) {
      final r = decoded['response'] as Map;
      final data = r['data'];
      if (data is Map) return data.cast<String, dynamic>();
    }
    if (decoded is Map) return decoded.cast<String, dynamic>();
    throw const ServerException(message: 'Unexpected response shape');
  }

  @override
  Future<ParentProfileModel> patchMe(Map<String, dynamic> body) async {
    try {
      final res = await dio.patch(
        ApiEndpoint.parentMe,
        data: body,
        options: Options(headers: {'Content-Type': 'application/json'}),
      );
      final decoded = _decode(res.data);
      final data = _unwrapData(decoded);
      return ParentProfileModel.fromJson(data);
    } on DioException catch (e) {
      final decoded = _decode(e.response?.data);
      final msg = (decoded is Map ? decoded['message'] : null)?.toString();
      throw ServerException(message: msg ?? 'Failed to update profile');
    }
  }

  @override
  Future<ParentProfileModel> getMe() async {
    try {
      final res = await dio.get(ApiEndpoint.parentMe);
      final decoded = _decode(res.data);
      final data = _unwrapData(decoded);
      return ParentProfileModel.fromJson(data);
    } on DioException catch (e) {
      final decoded = _decode(e.response?.data);
      final msg = (decoded is Map ? decoded['message'] : null)?.toString();
      throw ServerException(message: msg ?? 'Failed to load profile');
    }
  }

  @override
  Future<ParentChildModel> addChild({
    required String childName,
    required String gender,
    required DateTime birthDate,
  }) async {
    try {
      final res = await dio.post(
        ApiEndpoint.parentAddChild,
        data: {
          'childName': childName,
          'gender': gender,
          'birthDate': birthDate.toIso8601String(),
        },
        options: Options(headers: {'Content-Type': 'application/json'}),
      );
      final decoded = _decode(res.data);
      final data = _unwrapData(decoded);
      // Backend returns whole parent; fallback to re-fetch via getMe for correctness.
      final children = ParentProfileModel.fromJson(data).children;
      if (children.isEmpty) {
        throw const ServerException(message: 'Child was not created');
      }
      return children.last;
    } on DioException catch (e) {
      final decoded = _decode(e.response?.data);
      final msg = (decoded is Map ? decoded['message'] : null)?.toString();
      throw ServerException(message: msg ?? 'Failed to add child');
    }
  }

  @override
  Future<ParentChildModel> updateChild({
    required String childId,
    required String childName,
    required String gender,
    required DateTime birthDate,
    File? profileImage,
  }) async {
    try {
      final payload = {
        'childName': childName,
        'gender': gender,
        'birthDate': birthDate.toIso8601String(),
      };

      final formData = FormData.fromMap({
        'data': jsonEncode(payload),
        if (profileImage != null)
          'file': await MultipartFile.fromFile(
            profileImage.path,
            filename: profileImage.path.split('/').last,
          ),
      });

      final res = await dio.patch(
        '${ApiEndpoint.parentUpdateChild}$childId',
        data: formData,
      );

      final decoded = _decode(res.data);
      final data = _unwrapData(decoded);
      final children = ParentProfileModel.fromJson(data).children;
      final updated = children.where((c) => c.id == childId).toList();
      if (updated.isEmpty) {
        throw const ServerException(message: 'Child was not updated');
      }
      return updated.first;
    } on DioException catch (e) {
      final decoded = _decode(e.response?.data);
      final msg = (decoded is Map ? decoded['message'] : null)?.toString();
      throw ServerException(message: msg ?? 'Failed to update child');
    }
  }
}

