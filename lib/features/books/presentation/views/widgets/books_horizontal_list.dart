import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../providers/app_theme_provider.dart';
import '../../../data/model/book_Model.dart';
import '../screens/read_Book_Screen.dart';
import 'book_card_horizontal.dart';

class BooksHorizontalList extends StatelessWidget {
  final List<BookModel> books;

  const BooksHorizontalList({super.key, required this.books});

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<AppThemeProvider>();
    final isDark =
        themeProvider.appTheme == ThemeMode.dark ||
        (themeProvider.appTheme == ThemeMode.system &&
            MediaQuery.of(context).platformBrightness == Brightness.dark);
    final isRtl = Localizations.localeOf(context).languageCode == 'ar';
    return SizedBox(
      height: 230.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        reverse: isRtl,
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        itemCount: books.length,
        separatorBuilder: (_, __) => SizedBox(
          width: 8.w,
          child: VerticalDivider(
            color: isDark
                ? AppColors.border_card_default_dark
                : AppColors.border_card_default_light,
          ),
        ),
        itemBuilder: (context, index) => GestureDetector(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => ReadBookScreen(book: books[index]),
            ),
          ),
          child: BookCardHorizontal(book: books[index]),
        ),
      ),
    );
  }
}
