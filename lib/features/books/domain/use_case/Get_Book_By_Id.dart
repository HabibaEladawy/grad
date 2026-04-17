import 'package:dana_graduation_project/features/books/domain/entity/book_entity.dart';

import '../repo/Book_Repository.dart';

class GetBookById {
  final BookRepository repository;

  GetBookById(this.repository);

  Future<BookEntity> call(String id) async {
    return await repository.getBookById(id);
  }
}