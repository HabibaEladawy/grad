import '../entity/book_entity.dart';

abstract class BookRepository {
  Future<List<BookEntity>> getAllBooks();

  Future<BookEntity> getBookById(String id);
}