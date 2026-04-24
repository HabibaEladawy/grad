
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_style.dart';
import '../../../../../l10n/app_localizations.dart';
import '../../../../../providers/app_theme_provider.dart';
import '../../../data/model/book_Model_ui.dart';
import '../../../domain/entity/book_entity.dart';
import '../screens/read_Book_Screen.dart';

class BookDetails extends StatelessWidget {
  final BookEntity book;

  const BookDetails({
    super.key,
    required this.book,
  });

  @override
  Widget build(BuildContext context) {
    final isDark =
        context.watch<AppThemeProvider>().appTheme ==
            ThemeMode.dark;

    final l10n = AppLocalizations.of(context)!;

    final isRtl =
        Localizations.localeOf(context).languageCode == 'ar';

    final align =
    isRtl ? TextAlign.right : TextAlign.left;

    final direction =
    isRtl ? TextDirection.rtl : TextDirection.ltr;

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => ReadBookScreen(bookId: book.id),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: isRtl
              ? CrossAxisAlignment.start
              : CrossAxisAlignment.end,
          children: [
            Text(
              book.title,
              textAlign: align,
              textDirection: direction,
              style: AppTextStyle.semibold16TextHeading(context),
            ),

            SizedBox(height: 8.h),

            if (book.description.isNotEmpty) ...[
              Text(
                book.description,
                textAlign: align,
                textDirection: direction,
                style: AppTextStyle.medium12TextBody(context),
              ),
              SizedBox(height: 8.h),
            ],

            Row(
              textDirection: direction,
              children: [
                Text(
                  book.author,
                  style: AppTextStyle
                      .regular12TextBody(context)
                      .copyWith(
                    color: isDark
                        ? AppColors.primary_default_dark
                        : AppColors.primary_default_light,
                  ),
                ),
                const Spacer(),
              ],
            ),
          ],
        ),
      ),
    );  }
}