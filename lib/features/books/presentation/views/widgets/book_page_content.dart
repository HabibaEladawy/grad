
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_raduis.dart';
import '../../../../../core/utils/app_text_style.dart';
import '../../../../../providers/app_theme_provider.dart';
import '../../../data/model/book_Model_ui.dart';
import '../../../domain/entity/book_entity.dart';
import 'book_info_card.dart';


class BookPageContent extends StatelessWidget {
  final BookEntity book;
  final String pageText;
  final int pageIndex;
  final String chapterTitle;

  const BookPageContent({
    super.key,
    required this.book,
    required this.pageText,
    required this.pageIndex,
    required this.chapterTitle,
  });

  @override
  Widget build(BuildContext context) {
    final isDark =
        context.watch<AppThemeProvider>().appTheme == ThemeMode.dark;

    final isRtl =
        Localizations.localeOf(context).languageCode == 'ar';

    final align =
    isRtl ? TextAlign.right : TextAlign.left;

    final direction =
    isRtl ? TextDirection.rtl : TextDirection.ltr;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 20.w,
        vertical: 16.h,
      ),
      child: Column(
        crossAxisAlignment:
        isRtl ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          if (pageIndex == 0) _buildBookHeader(context, isDark),

          if (pageIndex == 0) SizedBox(height: 20.h),

          if (pageIndex == 0)
            Divider(
              height: 1,
              color: isDark
                  ? AppColors.border_card_default_dark
                  : AppColors.border_card_default_light,
            ),

          if (pageIndex == 0) SizedBox(height: 20.h),

          if (chapterTitle.isNotEmpty) _buildChapterHeader(context, isDark, isRtl),

          Text(
            pageText,
            textAlign: align,
            textDirection: direction,
            style: AppTextStyle.regular12TextBody(context),
          ),
        ],
      ),
    );
  }

  Widget _buildBookHeader(BuildContext context, bool isDark) {
    return BookInfoCard(book: book);
  }

  Widget _buildChapterHeader(
      BuildContext context,
      bool isDark,
      bool isRtl,
      ) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: 12.w,
        vertical: 8.h,
      ),
      decoration: BoxDecoration(
        border: Border(
          right: isRtl
              ? BorderSide(
            color: isDark
                ? AppColors.primary_default_dark
                : AppColors.primary_default_light,
            width: 4,
          )
              : BorderSide.none,
          left: !isRtl
              ? BorderSide(
            color: isDark
                ? AppColors.primary_default_dark
                : AppColors.primary_default_light,
            width: 4,
          )
              : BorderSide.none,
        ),
        color: isDark
            ? AppColors.border_card_default_dark.withOpacity(0.3)
            : AppColors.border_card_default_light.withOpacity(0.3),
        borderRadius: BorderRadius.only(
          topLeft: isRtl ? Radius.circular(AppRadius.radius_sm) : Radius.zero,
          bottomLeft:
          isRtl ? Radius.circular(AppRadius.radius_sm) : Radius.zero,
          topRight:
          !isRtl ? Radius.circular(AppRadius.radius_sm) : Radius.zero,
          bottomRight:
          !isRtl ? Radius.circular(AppRadius.radius_sm) : Radius.zero,
        ),
      ),
      child: Text(
        chapterTitle,
        textAlign: isRtl ? TextAlign.right : TextAlign.left,
        textDirection:
        isRtl ? TextDirection.rtl : TextDirection.ltr,
        style: AppTextStyle.semibold16TextHeading(context),
      ),
    );
  }
}