import 'package:dana_graduation_project/features/books/domain/entity/book_entity.dart';

import '../repo/Book_Repository.dart';

class GetAllBooks {
  final BookRepository repository;

  GetAllBooks(this.repository);

  Future<List<BookEntity>> call() async {
    return await repository.getAllBooks();
  }
}