import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entity/book_entity.dart';

abstract class BookRepository {
  Future<Either<Failure, List<BookEntity>>> getAllBooks();

  Future<Either<Failure, BookEntity>> getBookById(String id);
}