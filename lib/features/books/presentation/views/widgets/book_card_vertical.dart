
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_raduis.dart';
import '../../../../../core/utils/app_text_style.dart';
import '../../../../../providers/app_theme_provider.dart';
import '../../../data/model/book_Model_ui.dart';
import '../../../domain/entity/book_entity.dart';
import '../screens/read_Book_Screen.dart';
class BookCardVertical extends StatelessWidget {
  final BookEntity book;

  const BookCardVertical({
    super.key,
    required this.book,
  });

  @override
  Widget build(BuildContext context) {
    final isDark =
        context.watch<AppThemeProvider>().appTheme ==
            ThemeMode.dark;

    final isRtl =
        Localizations.localeOf(context).languageCode == 'ar';

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 24.w,
        vertical: 8.h,
      ),
      child: Row(
        textDirection:
        isRtl ? TextDirection.rtl : TextDirection.ltr,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius:
            BorderRadius.circular(AppRadius.radius_md),
            child: Image.network(
              book.cover,
              width: 92.w,
              height: 100.h,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) =>
              const Icon(Icons.broken_image),
            ),
          ),

          SizedBox(width: 12.w),

          Expanded(
            child: Column(
              crossAxisAlignment: isRtl
                  ? CrossAxisAlignment.start
                  : CrossAxisAlignment.start,
              children: [
                Text(
                  book.title,
                  textAlign:
                  isRtl ? TextAlign.right : TextAlign.left,
                  textDirection: isRtl
                      ? TextDirection.rtl
                      : TextDirection.ltr,
                  style:
                  AppTextStyle.semibold16TextHeading(context),
                ),

                SizedBox(height: 8.h),

                Text(
                  book.description.isNotEmpty
                      ? book.description
                      : '',
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  textAlign:
                  isRtl ? TextAlign.right : TextAlign.left,
                  textDirection: isRtl
                      ? TextDirection.rtl
                      : TextDirection.ltr,
                  style:
                  AppTextStyle.regular12TextBody(context),
                ),

                SizedBox(height: 8.h),

                Text(
                  book.author,
                  textAlign:
                  isRtl ? TextAlign.right : TextAlign.left,
                  textDirection: isRtl
                      ? TextDirection.rtl
                      : TextDirection.ltr,
                  style: AppTextStyle.medium12TextBody(context)
                      .copyWith(
                    color: isDark
                        ? AppColors.primary_default_dark
                        : AppColors.primary_default_light,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}