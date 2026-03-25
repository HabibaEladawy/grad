import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_raduis.dart';
import '../../../../../core/utils/app_text_style.dart';
import '../../../../../providers/app_theme_provider.dart';
import '../../../data/model/book_Model.dart';


class BookCardHorizontal extends StatelessWidget {
  final BookModel book;

  const BookCardHorizontal({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    final isDark = context.watch<AppThemeProvider>().appTheme == ThemeMode.dark;
    final isRtl = Localizations.localeOf(context).languageCode == 'ar';

    return SizedBox(
      width: 142.w,
      child: Column(
        crossAxisAlignment:
        isRtl ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Container(
            width: 142.w,
            height: 180.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppRadius.radius_md),
              border: Border(
                top: BorderSide(
                  color: isDark
                      ? AppColors.border_card_default_dark
                      : AppColors.border_card_default_light,
                  width: AppRadius.stroke_bold,
                ),
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(AppRadius.radius_md),
              child: Image.asset(
                book.imageUrl,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) =>
                const SizedBox.shrink(),
              ),
            ),
          ),
      SizedBox(height: 8.h),
      SizedBox(
        width: 142.w,
        child: Text(
          book.title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          textAlign: isRtl ? TextAlign.right : TextAlign.left,
          textDirection: isRtl ? TextDirection.rtl : TextDirection.ltr,
          style: AppTextStyle.medium12TextHeading(context),
        ),
      ),
      SizedBox(height: 4.h),
      Text(
        book.author,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        textAlign: isRtl ? TextAlign.right : TextAlign.left,
        textDirection: isRtl ? TextDirection.rtl : TextDirection.ltr,
        style: AppTextStyle.regular12TextBody(context).copyWith(
          fontSize: 8.sp,
          fontWeight: FontWeight.w400,
          color: AppColors.text_body_light,
        ),
      ),
      ]
      ),
    );
  }
}