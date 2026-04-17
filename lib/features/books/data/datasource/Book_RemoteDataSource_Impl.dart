import 'package:dio/dio.dart';

import '../../../../core/api/api_manger.dart';
import '../model/Book_Model.dart';
import 'Book_Remote_DataSource.dart';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../../../core/errors/exceptions.dart';

class BookRemoteDataSourceImpl implements BookRemoteDataSource {
  final ApiManger apiManger;

  const BookRemoteDataSourceImpl({
    required this.apiManger,
  });

  @override
  Future<List<BookModel>> getAllBooks() async {
    try {
      final response = await apiManger.getData(
        endPoint: '/books',
      );

      debugPrint("🟢 SUCCESS: /books fetched successfully");

      final List<dynamic> jsonList = response.data;

      return jsonList
          .map((json) => BookModel.fromJson(json))
          .toList();
    } on DioException catch (e) {
      debugPrint("🔴 NETWORK ERROR: ${e.message}");
      throw NetworkException(
        message: '❌ لا يوجد اتصال بالإنترنت',
      );
    } catch (e) {
      debugPrint("🔴 SERVER ERROR: $e");
      throw ServerException(
        message: '❌ فشل في جلب الكتب',
      );
    }
  }

  @override
  Future<BookModel> getBookById(String id) async {
    try {
      final response = await apiManger.getData(
        endPoint: '/books/$id',
      );

      debugPrint("🟢 SUCCESS: book $id fetched");

      return BookModel.fromJson(response.data);
    } on DioException catch (e) {
      debugPrint("🔴 NETWORK ERROR: ${e.message}");
      throw NetworkException(
        message: '❌ لا يوجد اتصال بالإنترنت',
      );
    } catch (e) {
      debugPrint("🔴 SERVER ERROR: $e");
      throw ServerException(
        message: '❌ فشل في جلب الكتاب',
      );
    }
  }
}