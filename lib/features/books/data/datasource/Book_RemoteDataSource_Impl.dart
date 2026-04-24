import 'package:dana_graduation_project/core/api/api_endpoint.dart';

import '../../../../core/api/api_manger.dart';
import '../model/Book_Model.dart';
import 'Book_Remote_DataSource.dart';


class BooksRemoteDataSourceImpl implements BooksRemoteDataSource {
  final ApiManger apiManger;

  BooksRemoteDataSourceImpl(this.apiManger);

  @override
  Future<List<BookModel>> getBooks() async {
    final response = await apiManger.getData(
      endPoint: ApiEndpoint.textBooks,
    );
    print(response.data.runtimeType);
    print(response.data);

    final data = response.data;

    print('RAW TYPE: ${data.runtimeType}');
    print('RAW DATA: $data');

    if (data is List) {
      return data
          .map((e) => BookModel.fromJson(e))
          .toList();
    }

    if (data is Map<String, dynamic> && data['data'] is List) {
      return (data['data'] as List)
          .map((e) => BookModel.fromJson(e))
          .toList();
    }

    throw Exception('Unexpected API format');
  }
  @override
  Future<BookModel> getBookById(String id) async {
    final response = await apiManger.getData(
      endPoint: "${ApiEndpoint.bookById}$id",
    );

    final data = response.data;

    print('TYPE: ${data.runtimeType}');
    print('DATA: $data');

    if (data is Map<String, dynamic>) {
      return BookModel.fromJson(data);
    }

    if (data is List) {
      return BookModel.fromJson(data.first);
    }

    throw Exception('Unexpected format: ${data.runtimeType}');
  }
}