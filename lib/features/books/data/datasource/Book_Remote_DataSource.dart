import '../model/Book_Model.dart';

abstract class BooksRemoteDataSource {
  Future<List<BookModel>> getBooks();
  Future<BookModel> getBookById(String id);
}

