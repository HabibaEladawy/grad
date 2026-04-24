import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_raduis.dart';
import '../../../../../core/utils/app_text_style.dart';
import '../../../../../providers/app_theme_provider.dart';
import '../../../domain/entity/book_entity.dart';


class BookCardHorizontal extends StatelessWidget {
  final BookEntity book;

  const BookCardHorizontal({
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

    return SizedBox(
      width: 142.w,
      child: Column(
        crossAxisAlignment: isRtl
            ? CrossAxisAlignment.start
            : CrossAxisAlignment.start,
        children: [
          Container(
            width: 192.w,
            height: 180.h,
            decoration: BoxDecoration(
              borderRadius:
              BorderRadius.circular(AppRadius.radius_md),
              border: Border.all(
                color: isDark
                    ? AppColors.border_card_default_dark
                    : AppColors.border_card_default_light,
                width: AppRadius.stroke_bold,
              ),
            ),
            child: ClipRRect(
              borderRadius:
              BorderRadius.circular(AppRadius.radius_md),
              child: Image.network(
                book.cover,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) =>
                const Icon(Icons.broken_image),
              ),
            ),
          ),

          SizedBox(height: 8.h),

          Text(
            book.title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign:
            isRtl ? TextAlign.right : TextAlign.left,
            textDirection:
            isRtl ? TextDirection.rtl : TextDirection.ltr,
            style: AppTextStyle.medium12TextHeading(context),
          ),

          SizedBox(height: 4.h),

          SizedBox(
            height: 11.h,
            width: 77.w,
            child: Text(
              book.author,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign:
              isRtl ? TextAlign.left : TextAlign.right,
              textDirection:
              isRtl ? TextDirection.ltr : TextDirection.rtl,
              style:
              AppTextStyle.regular8TextBody(context).copyWith(
                fontSize: 8.sp,
                color: isDark
                    ? AppColors.text_body_dark
                    : AppColors.text_body_light,
              ),
            ),
          ),
        ],
      ),
    );
  }
}