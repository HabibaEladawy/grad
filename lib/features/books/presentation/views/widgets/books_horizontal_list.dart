
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../providers/app_theme_provider.dart';
import '../../../data/model/book_Model_ui.dart';
import '../../../domain/entity/book_entity.dart';
import '../screens/read_Book_Screen.dart';
import 'book_card_horizontal.dart';

class BooksHorizontalList extends StatelessWidget {
  final List<BookEntity> books;

  const BooksHorizontalList({
    super.key,
    required this.books,
  });

  @override
  Widget build(BuildContext context) {
    final isDark =
        context.watch<AppThemeProvider>().appTheme == ThemeMode.dark;

    final isRtl =
        Localizations.localeOf(context).languageCode == 'ar';

    return SizedBox(
      height: 230.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 24.w),

        itemCount: books.length,

        separatorBuilder: (_, __) => SizedBox(width: 12.w),

        itemBuilder: (context, index) {
          final book = books[index];

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
            child: BookCardHorizontal(book: book),
          );
        },
      ),
    );
  }
}