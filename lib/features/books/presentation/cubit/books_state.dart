part of 'books_cubit.dart';

@immutable



abstract class BookState extends Equatable {
  const BookState();

  @override
  List<Object?> get props => [];
}

/* ================= INITIAL ================= */

class BookInitial extends BookState {
  const BookInitial();
}

/* ================= LOADING ================= */

class BookLoading extends BookState {
  const BookLoading();
}

/* ================= LIST OF BOOKS ================= */

class BookLoaded extends BookState {
  final List<BookEntity> books;

  const BookLoaded(this.books);

  @override
  List<Object?> get props => [books];
}

/* ================= SINGLE BOOK (DETAILS) ================= */

class BookDetailsLoaded extends BookState {
  final BookEntity book;

  const BookDetailsLoaded(this.book);

  @override
  List<Object?> get props => [book];
}

/* ================= ERROR ================= */

class BookError extends BookState {
  final String message;

  const BookError(this.message);

  @override
  List<Object?> get props => [message];
}