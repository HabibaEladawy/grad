import 'package:dana_graduation_project/features/books/domain/entity/book_entity.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../domain/repo/Book_Repository.dart';
import '../datasource/Book_Remote_DataSource.dart';


// Implementation
class BooksRepoImpl implements BookRepository {
  final BooksRemoteDataSource remoteDataSource;

  BooksRepoImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, List<BookEntity>>> getAllBooks() async {
    try {
      final result = await remoteDataSource.getBooks();

      final books = result
          .map((model) => model.toEntity())
          .toList();


      return Right(books);


    } catch (e) {
      print('❌ BooksRepoImpl Error: $e');

      return Left(
        ServerFailure(message: e.toString()),
      );
    }
  }

  @override
  Future<Either<Failure, BookEntity>> getBookById(String id) async {
    try {
      final result = await remoteDataSource.getBookById(id);

      return Right(result.toEntity());
    } catch (e) {
      return Left(
        ServerFailure(message: e.toString()),
      );
    }
  }
}