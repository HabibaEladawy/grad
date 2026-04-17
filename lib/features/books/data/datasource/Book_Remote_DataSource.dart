import '../model/Book_Model.dart';

abstract class BookRemoteDataSource {
  Future<List<BookModel>> getAllBooks();

  Future<BookModel> getBookById(String id);
}