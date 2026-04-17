import 'package:dana_graduation_project/features/books/domain/entity/book_entity.dart';

import '../../domain/repo/Book_Repository.dart';
import '../datasource/Book_Remote_DataSource.dart';


class BookRepositoryImpl implements BookRepository {
  final BookRemoteDataSource remoteDataSource;

  BookRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<BookEntity>> getAllBooks() async {
    try {
      return await remoteDataSource.getAllBooks();
    } catch (e) {
      throw Exception('Failed to load books');
    }
  }

  @override
  Future<BookEntity> getBookById(String id) async {
    try {
      return await remoteDataSource.getBookById(id);
    } catch (e) {
      throw Exception('Failed to load book');
    }
  }
}