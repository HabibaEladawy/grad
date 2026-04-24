
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../providers/app_theme_provider.dart';
import '../../../data/model/book_Model_ui.dart';
import '../../../domain/entity/book_entity.dart';
import '../screens/read_Book_Screen.dart';
import 'book_card_vertical.dart';



class BooksVerticalList extends StatelessWidget {
  final List<BookEntity> books;

  const BooksVerticalList({
    super.key,
    required this.books,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: books.map((book) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => ReadBookScreen(
                  bookId: book.id,
                ),
              ),
            );
          },
          child: BookCardVertical(book: book),
        );
      }).toList(),
    );
  }
}