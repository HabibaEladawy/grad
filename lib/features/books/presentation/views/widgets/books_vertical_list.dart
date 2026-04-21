import 'package:flutter/material.dart';
import '../../../data/model/book_Model.dart';
import '../screens/read_Book_Screen.dart';
import 'book_card_vertical.dart';

class BooksVerticalList extends StatelessWidget {
  final List<BookModel> books;

  const BooksVerticalList({super.key, required this.books});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: books.length,

      itemBuilder: (context, index) => GestureDetector(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => ReadBookScreen(book: books[index])),
        ),
        child: BookCardVertical(book: books[index]),
      ),
    );
  }
}
