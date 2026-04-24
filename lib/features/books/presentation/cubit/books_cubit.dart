import 'package:bloc/bloc.dart';
import 'package:dana_graduation_project/features/books/domain/entity/book_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../domain/repo/Book_Repository.dart';

part 'books_state.dart';


class BookCubit extends Cubit<BookState> {
  final BookRepository repository;

  BookCubit(this.repository) : super(const BookInitial());

  /* ================= GET ALL BOOKS ================= */

  Future<void> getBooks() async {
    emit(const BookLoading());

    final result = await repository.getAllBooks();

    result.fold(
          (failure) => emit(BookError(failure.message)),
          (books) => emit(BookLoaded(books)),
    );
  }

  /* ================= GET BOOK BY ID ================= */

  Future<void> getBookById(String id) async {
    emit(const BookLoading());
    print("------------------------------");

    final result = await repository.getBookById(id);
    print(result);


    result.fold(
          (failure) => emit(BookError(failure.message)),
          (book) => emit(BookDetailsLoaded(book)),
    );
  }
}