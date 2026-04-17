import 'package:bloc/bloc.dart';
import 'package:dana_graduation_project/features/books/domain/entity/book_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../domain/repo/Book_Repository.dart';

part 'books_state.dart';


// class BookCubit extends Cubit<BookState> {
//   final BookRepository repository;
//
//   BookCubit(this.repository) : super(BookInitial());
//
//   /* ================= GET ALL BOOKS ================= */
//
//   Future<void> getBooks() async {
//     emit(BookLoading());
//
//     try {
//       final result = await repository.getAllBooks();
//
//       result.fold(
//             (failure) => emit(BookError(failure.message)),
//             (books) => emit(BookLoaded(books)), // List<BookEntity>
//       );
//     } catch (e) {
//       emit(const BookError('❌ حصل خطأ غير متوقع'));
//     }
//   }
//
//   /* ================= GET BOOK BY ID ================= */
//
//   Future<void> getBookById(String id) async {
//     emit(BookLoading());
//
//     try {
//       final result = await repository.getBookById(id);
//
//       result.fold(
//             (failure) => emit(BookError(failure.message)),
//             (book) => emit(BookDetailsLoaded(book)), // Single BookEntity
//       );
//     } catch (e) {
//       emit(const BookError('❌ حصل خطأ غير متوقع'));
//     }
//   }
// }